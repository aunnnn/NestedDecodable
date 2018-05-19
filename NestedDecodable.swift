//
//  NestedDecodable.swift
//  
//
//  Created by Wirawit Rueopas on 19/5/18.
//

import Foundation

extension JSONDecoder {

    private static let nestedModelKeyPathCodingUserInfoKey = CodingUserInfoKey(rawValue: "nested_model_keypath")!

    private struct Key: CodingKey {
        let stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
            self.intValue = nil
        }

        let intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }

    private struct ModelResponse<TargetModel: Decodable>: Decodable {
        let model: TargetModel

        init(from decoder: Decoder) throws {
            // Split nested paths with '.'
            var keyPaths = (decoder.userInfo[JSONDecoder.nestedModelKeyPathCodingUserInfoKey]! as! String).split(separator: ".")

            // Get last key to extract in the end
            let lastKey = String(keyPaths.popLast()!)

            // Loop getting container until reach final one
            var targetContainer = try decoder.container(keyedBy: Key.self)
            for k in keyPaths {
                let key = Key(stringValue: String(k))!
                targetContainer = try targetContainer.nestedContainer(keyedBy: Key.self, forKey: key)
            }
            model = try targetContainer.decode(TargetModel.self, forKey: Key(stringValue: lastKey)!)
        }
    }

    /// Decodes a model T from json data with the given keypath.
    func decode<T: Decodable>(_ type: T.Type, from data: Data, keyPath: String) throws -> T {
        self.userInfo[JSONDecoder.nestedModelKeyPathCodingUserInfoKey] = keyPath
        return try self.decode(ModelResponse<T>.self, from: data).model
    }
}

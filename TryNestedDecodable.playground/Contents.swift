//: Playground - noun: a place where people can play

import UIKit

struct Post: Decodable {
    let title: String
    let detail: String
    let likes: Int
}

//do {
//    let path = Bundle.main.path(forResource: "test", ofType: "json")!
//    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//
//    let decoder = JSONDecoder()
//    let post1 = try decoder.decode(Post.self, from: data, keyPath: "post")
//    let post2 = try decoder.decode(Post.self, from: data, keyPath: "nested.post")
//    let post3 = try decoder.decode(Post.self, from: data, keyPath: "nested.post.embedded_post")
//
//    print(post1)
//    print(post2)
//    print(post3)
//} catch let error {
//    print("Error decoding: \(error.localizedDescription)")
//}

struct Thumbnail: Codable {
    let path: String
    let `extension`: String
}

struct Character: Codable {
    let id: Int
    let name: String
    let thumbnail: Thumbnail
    let description: String
}

do {
    let path = Bundle.main.path(forResource: "test2", ofType: "json")!
    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

    let decoder = JSONDecoder()
    let result = try decoder.decode([Character].self, from: data, keyPath: "data.results")
    result.forEach { (c) in
        print("Character: ", c)
        print("Thumbnail: ", c.thumbnail)
    }
} catch let error {
    print("Error decoding: \(error.localizedDescription)")
}


let d: Decoder! = nil
d.contain

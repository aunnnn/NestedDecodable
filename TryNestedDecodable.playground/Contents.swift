//: Playground - noun: a place where people can play

import UIKit

struct Post: Decodable {
    let title: String
    let detail: String
    let likes: Int
}

do {
    let path = Bundle.main.path(forResource: "test", ofType: "json")!
    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

    let decoder = JSONDecoder()
    let post1 = try decoder.decode(Post.self, from: data, keyPath: "post")
    let post2 = try decoder.decode(Post.self, from: data, keyPath: "nested.post")
    let post3 = try decoder.decode(Post.self, from: data, keyPath: "nested.post.embedded_post")

    print(post1)
    print(post2)
    print(post3)
} catch let error {
    print("Error decoding: \(error.localizedDescription)")
}

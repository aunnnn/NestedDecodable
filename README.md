# NestedDecodable
An extension to decode nested model of any depth with a keyPath.

It means you can do these:
```swift
let decoder = JSONDecoder()
let post1 = try decoder.decode(Post.self, from: data, keyPath: "post")
let post2 = try decoder.decode(Post.self, from: data, keyPath: "nested.post")
let post3 = try decoder.decode(Post.self, from: data, keyPath: "nested.post.embedded_post")
```
to decode this `Post` model:
```swift
struct Post: Decodable {
    let title: String
    let detail: String
    let likes: Int
}
```
from this json structure:
```swift
{
    "post": {
        "title": "Hello",
        "detail": "My post, hello!",
        "likes": 20
    },
    "something": "...",
    "nested": {
        "something": "...",
        "post": {
            "title": "What is this",
            "detail": "The nest seems to work",
            "likes": 14,
            "embedded_post": {
                "title": "Embedded Post",
                "detail": "Embedded post also work",
                "likes": 100
            }
        }
    }
}
```

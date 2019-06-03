//: [Previous](@previous)
import Foundation


/***************************************************
 [ 실습1 ]
 다음 주소를 통해 얻은 json 데이터(국제정거장 위치 정보)를 파싱하여 출력하기
 "http://api.open-notify.org/iss-now.json"
 
 ***************************************************/

func practice1() {
    let practice = "http://api.open-notify.org/iss-now.json"
    let apiUrl = URL(string: practice)!
    
    let dataTask = URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
//        guard let error1 = error as? NSError else {
//            print(error?.localizedDescription)
//            return }
        guard let res = response as? HTTPURLResponse else { return }
        print("http response: ", res)
        guard let data = data,
            let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
            else { return print("No Data")}
        guard let timestamp = jsonObject["timestamp"] as? Int,
            let message = jsonObject["message"] as? String,
            let position = jsonObject["iss_position"] as? [String: String],
            let locationX = position["longitude"] as? String,
            let locationY = position["latitude"] as? String
            else { return }
        
        print("timestamp", timestamp)
        print(message)
        print(locationX)
        print(locationY)
        
        
    }
    dataTask.resume()
}
practice1()


/***************************************************
 [ 실습2 ]
 User 구조체 타입을 선언하고
 다음 Json 형식의 문자열을 User 타입으로 바꾸어 출력하기
 
 e.g.
 User(id: 1, firstName: "Robert", lastName: "Schwartz", email: "rob23@gmail.com")
 User(id: 2, firstName: "Lucy", lastName: "Ballmer", email: "lucyb56@gmail.com")
 User(id: 3, firstName: "Anna", lastName: "Smith", email: "annasmith23@gmail.com")
 ***************************************************/

let jsonString2 = """
{
"users": [
{
"id": 1,
"first_name": "Robert",
"last_name": "Schwartz",
"email": "rob23@gmail.com"
},
{
"id": 2,
"first_name": "Lucy",
"last_name": "Ballmer",
"email": "lucyb56@gmail.com"
},
{
"id": 3,
"first_name": "Anna",
"last_name": "Smith",
"email": "annasmith23@gmail.com"
}
]
}
"""
//let test: [String:[[String: Any]]]
struct User {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
  
}

func practice2() {
    guard let userData = jsonString2.data(using: .utf8),
        let userList = try? JSONSerialization.jsonObject(with: userData) as? [String:[[String: Any]]]
        else { return }
    
    var users = [User]()
    for user in userList["users"]! {
        let id = user["id"] as? Int
        let first = user["first_name"] as? String
        let last = user["last_name"] as? String
        let email = user["email"] as? String
        users.append(User(id: id!, firstName: first!, lastName: last!, email: email!))
    }
    users.forEach { print($0) }
}
practice2()



/***************************************************
 [ 실습3 ]
 Post 구조체 타입을 선언하고
 다음 주소를 통해 얻은 JSON 데이터를 파싱하여 Post 타입으로 변환한 후 전체 개수 출력하기
 "https://jsonplaceholder.typicode.com/posts"
 ***************************************************/

struct Post {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

func practice3() {
    let url = "https://jsonplaceholder.typicode.com/posts"
    let apiUrl = URL(string: url)!
    
    let dataTask = URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
        guard let res = response as? HTTPURLResponse else { return }
        print("http response: ", res)
        
        guard let data = data,
            let postList = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]]
            else { return }
        
        var posts = [Post]()
        for post in postList {
            let userId = post["userId"] as? Int
            let id = post["id"] as? Int
            let title = post["title"] as? String
            let body = post["body"] as? String
            posts.append(Post(userId: userId!, id: id!, title: title!, body: body!))
        }
        print(posts.count)
    }.resume()
    
}

practice3()




//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)



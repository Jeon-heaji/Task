import UIKit

var str = "Hello, playground"

//func test2() {
//    return test()
//}

enum fail: Error {
    case failtocompletion
}

//func test4() -> (Result<String, fail>) {
//    return test3 { () -> (Result<String, fail>) in
//        ()
//    }
//}

func test(completion: @escaping ([String: Any]?) -> ()) {
    URLSession.shared.dataTask(with: URL(string: "https://api2.sktelecom.com/weather/forecast/3days?appKey=8a181ad4-8bdf-4ed2-96ae-3fe0e21d4b12&lat=36.1234&lon=127.1234")!) { (data, res, err) in
        
//        print(res)
        
        guard let res = res as? HTTPURLResponse, res.statusCode >= 200, res.statusCode < 300 else { completion(nil)
            return }
        
        let data2 = """
["ddd"
""".data(using: .utf8)
        
        guard let data = data else { return }
        
        do {
            let result = try JSONSerialization.jsonObject(with: data2!)
            print("inside", result)
        } catch(let err) {
            print("error", err.localizedDescription)
        }
        
        let result = try? JSONSerialization.jsonObject(with: data2!) as? [String: Any]
            print("outside", result)
//        print(data)
        completion(result)
    }.resume()
}

test() { abc in
    print(abc)
}

//func test3(com: @escaping () -> (Result<String, fail>)) {
//    com()
//}


import UIKit

struct Beer: Codable {
    
    let name: String
    let id: Int
    let foodPairing: [String]
    let method: Method
    
    struct Method: Codable {
        let mashTemp: [MashTemp]
        
        struct MashTemp: Codable {
            let temp: Temp
        }
        struct Temp: Codable {
            let value: Int
        }
        
        enum CodingKeys: String, CodingKey {
            case mashTemp = "mash_temp"
        }
    }

    enum CodingKeys: String, CodingKey {
        case name
        case id
        case foodPairing = "food_pairing"
        case method
    }
    
}

func jsonBeer() {
    let urlString = "https://api.punkapi.com/v2/beers/1"
    let url = URL(string: urlString)!
    
    let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let res = response as? HTTPURLResponse else { return }
        print(res)
        
        guard let data = data,
            let beerList = try? JSONDecoder().decode([Beer].self, from: data)
            else {
                print("Json error")
                return }
        
        print(beerList)
        
        }.resume()
}
jsonBeer()


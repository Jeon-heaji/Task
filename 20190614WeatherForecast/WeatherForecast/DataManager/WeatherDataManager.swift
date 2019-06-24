//
//  WeatherDataManager.swift
//  WeatherForecast
//
//  Created by Jeon-heaji on 12/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation
class WeatherDataManager {
    static var shared = WeatherDataManager()
    
    let currentUrl: String = "https://api2.sktelecom.com/weather/current/hourly?appKey=158b41b8-90d3-4c46-a3cd-9c239f8492f2&version=2"
    //    let appId: String = "&lat=36.1234&lon=127.1234"
    
    let forecastUrl: String = "https://api2.sktelecom.com/weather/forecast/3days?appKey=158b41b8-90d3-4c46-a3cd-9c239f8492f2&version=2"
    
    var gridData = ""
    var hourlyDatas = [String: Any]()
    
    // 현재날씨(시간별)
    func setCurrentWeather(lati: Float, longi: Float,
                           completion: @escaping ((addr: String, hourly: [String: Any])) -> ()) {
        let strLati = "&lat=\(lati)"
        let strLongi = "&lon=\(longi)"
        guard let url = URL(string: currentUrl + strLati + strLongi) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                //                print(String(data: data, encoding: .utf8))
                
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    guard let weather = dictionary?["weather"] as? [String: Any],
                        let hourly = weather["hourly"] as? [Any],
                        let hourlyData = hourly[0] as? [String: Any],
                        let grid = hourlyData["grid"] as? [String: Any],
                        let city = grid["city"] as? String,
                        let county = grid["county"] as? String,
                        let village = grid["village"] as? String,
                        let sky = hourlyData["sky"] as? [String: Any],
                        let name = sky["name"] as? String,
                        let code = sky["code"] as? String,
                        let temperature = hourlyData["temperature"] as? [String: Any],
                        let tc = temperature["tc"] as? String,
                        let tmax = temperature["tmax"] as? String,
                        let tmin = temperature["tmin"] as? String
                        else { return }
                    
                    self.gridData = city + " " + county + " " + village
                    self.hourlyDatas = [
                        "name": name,
                        "code": code,
                        "tc": tc,
                        "tmax": tmax,
                        "tmin": tmin
                    ]
                    completion((self.gridData, self.hourlyDatas))
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
    
    // 단기예보
    func setShortRangeForecast(lati: Float, longi: Float,
                               completion: @escaping ([ShortRangeForecast]) -> ()) {
        let strLati = "&lat=\(lati)"
        let strLongi = "&lon=\(longi)"
        guard let url = URL(string: forecastUrl + strLati + strLongi) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    guard let weather = dictionary?["weather"] as? [String: Any],
                        let forecast3days = weather["forecast3days"] as? [Any],
                        let forecast3daysData = forecast3days[0] as? [String: Any],
                        let timeRelease = forecast3daysData["timeRelease"] as? String,
                        let fcst3hour = forecast3daysData["fcst3hour"] as? [String: Any],
                        let sky = fcst3hour["sky"] as? [String: String],
                        let temperature = fcst3hour["temperature"] as? [String: String]
                        else { return }
                    
                    var forecastArr: [ShortRangeForecast] = []
                    for hour in stride(from: 4, through: 67, by: 3) {
                        guard let skyCode = sky["code\(hour)hour"], !skyCode.isEmpty,
                            let skyName = sky["name\(hour)hour"], !skyName.isEmpty,
                            let tempStr = temperature["temp\(hour)hour"],
                            let temp = Double(tempStr)
                            else { continue }
                        
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                        // timeRelease -> releaseTime변수에 담아서 비교하기위해
                        guard let releaseTime = dateFormatter.date(from: timeRelease) else { continue }
                        let forecastTime = releaseTime.addingTimeInterval(TimeInterval(hour) * 3600)
                        
                        // 60초 * 60분
                        
                        let forecast = ShortRangeForecast(
                            skyCode: skyCode, skyName: skyName, temperature: temp, date: forecastTime
                        )
                        forecastArr.append(forecast)
                    }
                    
                    completion(forecastArr)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
}

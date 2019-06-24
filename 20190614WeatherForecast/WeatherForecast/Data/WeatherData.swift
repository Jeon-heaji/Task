//
//  WeatherData.swift
//  WeatherForecast
//
//  Created by Jeon-heaji on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

// 시간별
// MARK: - Weather
// MARK: - HourlyWeatherWeather
struct Weather: Codable {
    let weather: WeaterClass
}
struct WeaterClass: Codable {
    let hourly: [Hourly]
}

// MARK: - Hourly
struct Hourly: Codable {
    let grid: Grid
    let sky: Sky
    let temperature: Temperature
}

// MARK: - Grid
struct Grid: Codable {
    let city, county: String
    let village: String
}

// MARK: - Sky
struct Sky: Codable {
    let code, name: String
}

// MARK: - Temperature
struct Temperature: Codable {
    let tc, tmax, tmin: String
}


// 단기예보

struct ShortRangeForecast {
    let skyCode: String
    let skyName: String
    let temperature: Double
    let date: Date
}
    


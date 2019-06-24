//
//  Extension.swift
//  WeatherForecast
//
//  Created by Jeon-heaji on 13/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = Calendar.current.timeZone
        dateFormatter.dateFormat = "a hh:mm"
        dateFormatter.locale = Locale(identifier: "ko")
        let toString = dateFormatter.string(from: self as Date)
        return toString
    }
    func toDate() -> String {
        let date = DateFormatter()
        date.timeZone = Calendar.current.timeZone
        date.dateFormat = "MM.dd(EE)"
        let toDate = date.string(from: self as Date)
        return toDate
    }
    func time() -> String {
        let date = DateFormatter()
        date.timeZone = Calendar.current.timeZone
        date.dateFormat = "HH:mm"
        let toDate = date.string(from: self as Date)
        return toDate
    }
    
    
}



//
//  SingletonClass.swift
//  20190404_UISlider
//
//  Created by Jeon-heaji on 04/04/2019.
//  Copyright © 2019 Jeon-heaji. All rights reserved.
//

import Foundation
// singletonClass생성 변수는 Float타입 지정

class SingletonClass {
    static let shared = SingletonClass()
    var redSlider1: Float = 0.0
    var greenSlider1: Float = 0.0
    var blueSlider1: Float = 0.0
}

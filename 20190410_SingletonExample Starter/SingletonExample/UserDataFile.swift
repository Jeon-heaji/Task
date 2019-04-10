//
//  UserDataFile.swift
//  SingletonExample
//
//  Created by Jeon-heaji on 10/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import Foundation

class UserData{
    static let shared = UserData()
    
    private init () {}
    var userName = ""
    var userPassword = ""
    var userAge = ""
    var userMobile = ""
    
    
}

//
//  Profile.swift
//  quick-profile
//
//  Created by Kendall Aubertot on 7/9/15.
//  Copyright (c) 2015 kndl. All rights reserved.
//

import UIKit

class Profile: NSObject {
    var username: String
    var password: String
    var firstName: String!
    var lastName: String!
    
    init(username: String, password: String, firstName: String!, lastName: String!) {
        self.username = username
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        super.init()
    }
    
    func valid() -> Bool {
        return !username.isEmpty && !password.isEmpty
    }
}

//
//  UserResponseObject.swift
//  TestIos
//
//  Created by Pedro Alonso Daza B on 24/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit

class UserResponseObject:NSObject
{
    var name = ""
    var email = ""
    var phone = ""
    var website = ""
    
    init(dic: NSDictionary)
    {
        name = ValueJsonString(dic: dic, key: "name")
        email = ValueJsonString(dic: dic, key: "email")
        phone = ValueJsonString(dic: dic, key: "phone")
        website = ValueJsonString(dic: dic, key: "website")
    }
    
}

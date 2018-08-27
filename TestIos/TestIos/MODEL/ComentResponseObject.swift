//
//  ComentResponseObject.swift
//  TestIos
//
//  Created by Pedro Alonso Daza B on 24/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit

class ComentResponseObject:NSObject
{

    var body = ""
    
    init(dic:NSDictionary)
    {
        body = ValueJsonString(dic: dic, key: "body")
    }
}

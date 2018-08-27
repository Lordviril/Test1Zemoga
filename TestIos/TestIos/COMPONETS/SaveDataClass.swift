//
//  SaveDataClass.swift
//  TestIos
//
//  Created by Pedro Alonso Daza B on 27/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit
import Material

func SetDataPostArrayData(posts: NSArray)//, product:String)
{
    let Id = "KIdJson"
    
    print(posts)
    UserDefaults.standard.set(posts, forKey: Id)
    
}

func GetDataPostArrayData() -> NSArray?
{
    
    let Id = "KIdJson"
    
    var Posts:NSArray?;
    if let posts = UserDefaults.standard.object(forKey: Id)
    {
        Posts = posts as! NSArray
    }
    
    
    
    return Posts
}

func removeAllData()
{
    let domain = Bundle.main.bundleIdentifier!
    UserDefaults.standard.removePersistentDomain(forName: domain)
    UserDefaults.standard.synchronize()
    print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
}

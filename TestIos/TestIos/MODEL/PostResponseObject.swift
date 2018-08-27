//
//  PostResponseObject.swift
//  TestIos
//
//  Created by Pedro Alonso Daza B on 24/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation

class PostResponseObject: NSObject
{
    
    var userId = 0;
    var id = 0;
    var title = "";
    var body = "";
    //not serializable
    var state = 0
    
    
    init(dic: NSDictionary)
    {
        userId = ValueJsonInt(dic: dic, key: "userId")
        id = ValueJsonInt(dic: dic, key: "id")
        title = ValueJsonString(dic: dic, key: "title")
        body = ValueJsonString(dic: dic, key: "body")
        
        state = ValueJsonInt(dic: dic, key: "state")
    }
    
    func getDic() -> NSDictionary
    {
        let dic = ["userId":userId, "id":id, "title":title, "body":body, "state": state] as [String : Any]
        
        return dic as NSDictionary
    }
}


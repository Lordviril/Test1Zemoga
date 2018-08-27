//
//  UserRest.swift
//  TestIos
//
//  Created by Pedro Alonso Daza B on 24/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit
import SwiftSpinner

func getUser(Controller:UIViewController, userId:Int, Ok:@escaping ((UserResponseObject)->Void) )
{
    
    
    
    SwiftSpinner.show("Cargando...")
    getDictionary(url: KUrlUser + "\(userId)", Ok: {res in
        var User = UserResponseObject(dic: res)

        
        Ok(User)
        
        SwiftSpinner.hide()
        
    }, Error: { res in
        SwiftSpinner.hide()
        showAlertError(View: Controller, Men: res)
        
    })
    
}

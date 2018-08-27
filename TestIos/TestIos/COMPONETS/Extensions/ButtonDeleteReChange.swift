//
//  ButtonDeleteReChange.swift
//  TestIos
//
//  Created by Pedro Alonso Daza B on 27/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit
import Material

class ButtonDeleteReChange: Button
{
    var isDeleteState = true
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    func setDataDelete()
    {
        

        UIView.animate(withDuration: 1.0, delay: 0.0, options:[], animations: {
            self.backgroundColor = UIColor.red
        }, completion:nil)
        
        self.setTitle("Delete All", for: .normal)
        self.backgroundColor = UIColor.red
        isDeleteState = true
        
        
    }
    
    func setDataChange()
    {
        

        UIView.animate(withDuration: 1.0, delay: 0.0, options:[], animations: {
            self.backgroundColor = UIColor.blue
        }, completion:nil)
        
        self.setTitle("Load Data", for: .normal)
        self.backgroundColor = UIColor.blue
        isDeleteState = false
    }
}

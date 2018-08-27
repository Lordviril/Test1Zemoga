//
//  PostCellController.swift
//  TestIos
//
//  Created by Pedro Alonso Daza B on 24/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit

class PostCellController:UITableViewCell
{
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var imState: UIImageView!
    
    func setPost(post:PostResponseObject)
    {
        lbTitle.text = post.title
        
        if post.state == 0
        {
            imState.image = UIImage(named: "ic_no_read")
        }
        else if post.state == 2
        {
            imState.image = UIImage(named: "ic_favorite")
        }
        else
        {
            imState.image = nil
        }
    }
    @IBAction func showDetail(_ sender: Any) {
    }
    @IBOutlet weak var triShowDetail: UIButton!
}

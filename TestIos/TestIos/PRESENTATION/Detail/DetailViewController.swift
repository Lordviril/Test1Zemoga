//
//  DetailViewController.swift
//  TestIos
//
//  Created by Pedro Alonso Daza B on 24/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit
import Material

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var lbDescription:UILabel!
    @IBOutlet weak var etName:TextField!
    @IBOutlet weak var etEmail:TextField!
    @IBOutlet weak var etPhone:TextField!
    @IBOutlet weak var etWebSite:TextField!
    
    @IBOutlet weak var tableView:UITableView!
    
    var Coments = [ComentResponseObject]()
    
    var Post = PostResponseObject(dic: ["":""])
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        lbDescription.text = Post.body
        
        
        getUser(Controller: self, userId: Post.userId, Ok: { res in
            
            self.etName.text = res.name
            self.etEmail.text = res.email
            self.etPhone.text = res.phone
            self.etWebSite.text = res.website
        })
        
        getComntsWithPostId(Controller: self, postId: Post.id, Ok: {res in
            
            self.Coments = res
            
            self.tableView.reloadData()
        })
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Coments.count
    }
    
    
    var cambiocolor = true
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath as IndexPath)
        
        let row = indexPath.row
        
        cell.textLabel?.text = Coments[row].body

        
        return cell
    }
    
    
    private func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
    }

}

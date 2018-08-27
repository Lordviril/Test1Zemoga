//
//  ViewController.swift
//  TestIos
//
//  Created by Pedro Alonso Daza B on 23/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//
import Foundation
import UIKit
import Material

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var sgFilter: UISegmentedControl!
    @IBOutlet weak var  tableView: TableView!
    @IBOutlet weak var  btDeleteAll: ButtonDeleteReChange!
    
    var Posts = [PostResponseObject]()
    var Post = PostResponseObject(dic:["":""])
    var PostFavorite = [PostResponseObject]()

    var PostReview = [PostResponseObject]()
    var isFavorite = false
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        loadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func loadData()
    {
        getAllPosts(Controller: self, Ok: { res in
            self.Posts = res
            self.PostReview  = self.Posts
            
            var fvoritepost = [PostResponseObject]()
            for fv in self.Posts
            {
                if (fv.state == 2)
                {
                    fvoritepost.append(fv)
                }
            }
            self.PostFavorite = fvoritepost
            self.tableView.reloadData()
            
        })
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Posts = removePost(PostReview[indexPath.row], posts: Posts)
            self.PostReview  = self.Posts
            tableView.deleteRows(at: [indexPath], with: .fade)
            SetDataPostArrayData(posts: getArrayData(posts: self.PostReview) as NSArray)
        }
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Borrar") { (action, indexPath) in
            // delete item at indexPath
            self.Posts = removePost(self.PostReview[indexPath.row], posts: self.Posts)
            self.PostReview  = self.Posts
            tableView.deleteRows(at: [indexPath], with: .fade)
            SetDataPostArrayData(posts: getArrayData(posts: self.PostReview) as NSArray)

        }
        
        let favorite = UITableViewRowAction(style: .default, title: "Favorite") { (action, indexPath) in

            self.Posts = setPostFavorite(self.PostReview[indexPath.row], posts: self.Posts)
            self.PostReview  = self.Posts
            SetDataPostArrayData(posts: getArrayData(posts: self.PostReview) as NSArray)
            self.tableView.reloadData()

        }
        
        
        favorite.backgroundColor = UIColor.yellow
        
        return [delete, favorite]
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if self.Post.state == 0
            {
                self.Post.state = 1
            }
            
            if let destinationVC = segue.destination as? DetailViewController {
                SetDataPostArrayData(posts: getArrayData(posts: self.PostReview) as NSArray)
                    destinationVC.Post = self.Post
                
            }
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.PostReview.count
    }
    
    
    var cambiocolor = true
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath as IndexPath) as! PostCellController
        
        let row = indexPath.row
        
        
        cell.setPost(post: self.PostReview[row])
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        Post = selectPost(self.PostReview[indexPath.row], posts: self.Posts)
        
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    /*private func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        Post = Posts[indexPath.row]
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }*/


    @IBAction func chFilter(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex
        {
        case 0:
            self.PostReview = self.Posts
            isFavorite = false
        case 1:
            var fvoritepost = [PostResponseObject]()
            for fv in self.Posts
            {
                if (fv.state == 2)
                {
                    fvoritepost.append(fv)
                }
            }
            self.PostFavorite = fvoritepost
            self.PostReview = self.PostFavorite
            isFavorite = true
        default:
            break
        }
        
        self.tableView.reloadData()
    }
    
    
    @IBAction func triLoadData(_ sender: ButtonDeleteReChange) {
        if sender.isDeleteState
        {
            self.PostReview = [PostResponseObject]()
            self.Posts = [PostResponseObject]()
            self.PostFavorite = [PostResponseObject]()
            
            tableView.reloadData()
            sender.setDataChange()
        }else
        {
            loadData()
            sender.setDataDelete()
        }
        
    }
}


//
//  PostRest.swift
//  TestIos
//
//  Created by Pedro Alonso Daza B on 24/08/18.
//  Copyright © 2018 Pedro Alonso Daza B. All rights reserved.
//

import Foundation
import UIKit
import SwiftSpinner

func getAllPosts(Controller:UIViewController, Ok:@escaping (([PostResponseObject])->Void) )
{
    

    if let data = GetDataPostArrayData()
    {
        var posts = [PostResponseObject]()
        

        for re in data
        {
            let pos = PostResponseObject(dic: re as! NSDictionary)

            posts.append(pos)
            
        }
        
        if posts.count >= 1
        {
            Ok(posts)
        }
        return
    }
    
    SwiftSpinner.show("Cargando...")
    getArray(url: KUrlPosts, Ok: {res in
        
        var posts = [PostResponseObject]()
        
        var i = 0
        for re in res
        {
            let pos = PostResponseObject(dic: re as! NSDictionary)
            if i <= 19
            {
                pos.state = 0
            }
            else
            {
                pos.state = 1
            }
            posts.append(pos)
            
            i = i + 1
        }
        
        if posts.count >= 1
        {
            Ok(posts)
        }
        else
        {
            showAlertError(View: Controller, Men: ErrorEmptyZones)
        }

        
        
        SwiftSpinner.hide()
        
    }, Error: { res in
        SwiftSpinner.hide()
        showAlertError(View: Controller, Men: res)
        
    })
    
}

func getComntsWithPostId(Controller:UIViewController, postId:Int, Ok:@escaping (([ComentResponseObject])->Void) )
{
    
    
    
    SwiftSpinner.show("Cargando...")
    getArray(url: KUrlPostsComnets.replacingOccurrences(of: "{idPost}", with: "\(postId)"), Ok: {res in
        
        var posts = [ComentResponseObject]()

        for re in res
        {
            let pos = ComentResponseObject(dic: re as! NSDictionary)

            posts.append(pos)

        }
        
        if posts.count >= 1
        {
            Ok(posts)
        }
        else
        {
            showAlertError(View: Controller, Men: ErrorEmptyZones)
        }
        
        
        
        SwiftSpinner.hide()
        
    }, Error: { res in
        SwiftSpinner.hide()
        showAlertError(View: Controller, Men: res)
        
    })
    
}

func removePost(_ post:PostResponseObject, posts:[PostResponseObject]) -> [PostResponseObject]
{
    var i = 0
    var postsTemporal = posts
    for post1 in posts
    {
        if post1.id == post.id
        {
            postsTemporal.remove(at: i)
            break
        }
        
        i = i + 1
    }
    
    return postsTemporal
}

func setPostFavorite(_ post:PostResponseObject, posts:[PostResponseObject]) -> [PostResponseObject]
{
    var i = 0
    var postsTemporal = posts
    for post1 in posts
    {
        if post1.id == post.id
        {
            postsTemporal[i].state = 2
            break
        }
        
        i = i + 1
    }
    
    return postsTemporal
}

func selectPost(_ post:PostResponseObject, posts:[PostResponseObject]) -> PostResponseObject
{
    var i = 0
    var postsTemporal = PostResponseObject(dic: ["":""])
    for post1 in posts
    {
        if post1.id == post.id
        {
            postsTemporal = post1
            break
        }
        
        i = i + 1
    }
    
    return postsTemporal
}

func getArrayData(posts:[PostResponseObject]) -> [NSDictionary]
{
    var aPosts = [NSDictionary]()
    
    for post in posts
    {
        aPosts.append(post.getDic())
    }
    
    return aPosts
}



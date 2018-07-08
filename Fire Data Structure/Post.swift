//
//  Post.swift
//  Fire Data Structure
//
//  Created by Joey Slomowitz on 7/7/18.
//  Copyright © 2018 Joey Slomowitz. All rights reserved.
//

import Foundation

struct Post: Codable {
    
    let postId: String
    let username: String
    let message: String
    let date: Date
    
    init?(postID: String, dict: [String: Any]) {
        
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +zzzz"
        
        
        guard let username = dict["username"] as? String,
        let message = dict["message"] as? String,
        let dateString = dict["date"] as? String,
        let date = dateFormatter.date(from: dateString)
        
            else { return nil }
        
        self.postId = postID
        self.username = username
        self.message = message
        self.date = date
    }
}

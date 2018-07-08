//
//  DatabaseService.swift
//  Fire Data Structure
//
//  Created by Joey Slomowitz on 7/7/18.
//  Copyright © 2018 Joey Slomowitz. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DatabaseService {
    
    static let shared = DatabaseService()
    private init() {}
    
    let postsReference = Database.database().reference().child("posts")
    let beersReference = Database.database().reference().child("beers")
}


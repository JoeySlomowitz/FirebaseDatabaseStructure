//
//  PostsSnapshot.swift
//  Fire Data Structure
//
//  Created by Joey Slomowitz on 8/7/18.
//  Copyright © 2018 Joey Slomowitz. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct PostsSNapshot {
    
    let posts: [Post]
    
    init?(with snapShot: DataSnapshot) {
        var posts = [Post]()
        guard let snapDict = snapShot.value as? [String: [String: Any]] else { return nil }
        for snap in snapDict {
            guard let post = Post(postID: snap.key, dict: snap.value) else { continue }
            posts.append(post)
        }
        self.posts = posts
    }
}

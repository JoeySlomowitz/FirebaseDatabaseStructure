//
//  ViewController.swift
//  Fire Data Structure
//
//  Created by Joey Slomowitz on 6/7/18.
//  Copyright © 2018 Joey Slomowitz. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    
    var posts = [Post]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Post Something", message: "What would you like to post?", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter message here"
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let post = UIAlertAction(title: "Post", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            
            print(text)
            
            let dateString = String(describing: Date())
            
            let parameters = ["username": "@joeyslomowitz",
                              "message": text,
                              "date": dateString]
            
            DatabaseService.shared.postsReference.childByAutoId().setValue(parameters)
        }
        alert.addAction(cancel)
        alert.addAction(post)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DatabaseService.shared.postsReference.observe(.value) { (snapshot) in
            print(snapshot)
            
            guard let postsSnapshot = PostsSNapshot(with: snapshot) else { return }
            self.posts = postsSnapshot.posts
            self.posts.sort(by: { $0.date.compare($1.date) == .orderedDescending })
            self.tableView.reloadData()
        }
        
    }
    
    
    
    
}


extension ViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = posts[indexPath.row].message
        cell.detailTextLabel?.text = posts[indexPath.row].username
        
        return cell
    }
    
}


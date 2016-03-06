//
//  HomeViewController.swift
//  Instaroids
//
//  Created by Arnold Ballesteros on 3/5/16.
//  Copyright © 2016 Arnold Ballesteros. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var posts : [PFObject]?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refreshControlAction:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.insertSubview(refreshControl, atIndex: 0)
        
        tableView.delegate = self
        tableView.dataSource = self
        loadPosts()
        tableView.reloadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of Rows Initializing")
        if posts != nil {
            print("Rows Initialized!")
            return posts!.count
        } else {
            print("Rows failed to initialize")
            return 0
        }

    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PostsCell", forIndexPath: indexPath) as! PostsCell
        if (posts != nil) {
            let post = posts![indexPath.row]
            cell.post = post
        }
    
        return cell
    }
    
    func loadPosts() {
        // construct PFQuery
        print("Loading Posts")
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        print(query)
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (post: [PFObject]?, error: NSError?) -> Void in
            if let post = post {
                print("Loading asynchronously")
                self.posts = post
                self.tableView.reloadData()
                
            } else {
                print(error)
            }
            
        }
    }
    func refreshControlAction(refreshControl: UIRefreshControl) {
        self.tableView.reloadData()
        loadPosts()
        refreshControl.endRefreshing()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

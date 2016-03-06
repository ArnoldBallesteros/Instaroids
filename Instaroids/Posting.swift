//
//  Posting.swift
//  Instaroids
//
//  Created by Arnold Ballesteros on 3/6/16.
//  Copyright © 2016 Arnold Ballesteros. All rights reserved.
//

import UIKit
import Parse
class Posting: NSObject {
    
    var name : String?
    var image : UIImage?
    var author : String?
    var caption : String?
    var cell : PostsCell?
    
    
    init(post : PFObject) {
        super.init()
        
        let newPost = post
        
        name = newPost["name"] as? String
        author = newPost["author"] as? String
        caption = newPost["caption"] as? String
        
        
        /**
         Method to convert UIImage to PFFile
         
         - parameter image: Image that the user wants to upload to parse
         
         - returns: PFFile for the the data in the image
         */
        if let postedImage = post.valueForKey("media")! as? PFFile {
            postedImage.getDataInBackgroundWithBlock({ (success : NSData?, error: NSError?) -> Void in
                if (error == nil) {
                    let image = UIImage(data:success!)
                    self.image = image
                    self.cell?.picture = self
                } else {
                    print(error?.localizedDescription)
                }
            })
        }
        
        
        

    }

}

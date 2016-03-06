//
//  PostsCell.swift
//  Instaroids
//
//  Created by Arnold Ballesteros on 3/5/16.
//  Copyright © 2016 Arnold Ballesteros. All rights reserved.
//

import UIKit
import Parse

class PostsCell: UITableViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    var posts: PFObject? {
        didSet {
            usernameLabel.text = posts!["author"] as? String
            captionLabel.text = posts!["caption"] as? String
           // Post.getPFFileFromImage(UIImage?)
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

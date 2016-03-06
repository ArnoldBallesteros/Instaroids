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
    
    var post: PFObject? {
        didSet {
            picture = Posting(post: post!)
            picture.cell = self
            
            /*
            usernameLabel.text = posts!["author"] as? String
            print(usernameLabel.text)
            captionLabel.text = posts!["caption"] as? String
            postImageView.image = posts!["media"] as? UIImage
           // Post.getPFFileFromImage(UIImage?)
            */
        }
    }
    
    var picture: Posting! {
        didSet {
            postImageView.image = picture.image
            captionLabel.text = picture.caption
            usernameLabel.text = picture.author
            print("Labels")
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

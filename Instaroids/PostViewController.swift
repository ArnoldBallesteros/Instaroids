//
//  PostViewController.swift
//  Instaroids
//
//  Created by Arnold Ballesteros on 3/5/16.
//  Copyright © 2016 Arnold Ballesteros. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    @IBOutlet weak var captionTextView: UITextView!
    @IBOutlet weak var prePostImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Implement Delegate
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            let image = originalImage
            // Do something with the images (based on your use case)
            prePostImageView.image = image
            
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
            
    }

    
    @IBAction func onGalleryTap(sender: AnyObject) {
        //Instantiate a UIImagePickerController for PhotoLibrary
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
        
      
    }
    @IBAction func onCameraTap(sender: AnyObject) {
        //Instantiate a UIImagePickerController for Camera
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(vc, animated: true, completion: nil)

    }
    
    @IBAction func onPostTap(sender: AnyObject) {
        Post.postUserImage(prePostImageView.image, withCaption: captionTextView.text) { (success: Bool,error: NSError?) -> Void in
            print("Photo Submitted")
        }
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

//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Kunal Desai on 6/20/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var photoImage: UIImage!

    @IBOutlet weak var photoImageView: UIImageView!
    var newlyCreatedFace: UIImageView!
    var newlyCreatedFaceOriginalCenter: CGPoint!
    
    @IBOutlet weak var doneButtonImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.image = photoImage

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    @IBAction func panPhoto(sender: UIPanGestureRecognizer) {
        
        
        //      dismissViewControllerAnimated(true, completion: nil)
        //       let location = sender.locationInView(photoImageView)
        let translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            
            let imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            self.photoImageView.hidden = true
            self.doneButtonImageView.hidden = true
            
            newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)
            
            
  //          self.photoImageView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            
            
        }  // changed
            
        else if sender.state == UIGestureRecognizerState.Ended {
            
            //       self.photoImageView.alpha = 1
            //        newlyCreatedFace.center = CGPoint(x:160,y:320)
            
            
            if translation.y > 100 {
            dismissViewControllerAnimated(true, completion: nil)    
            }  else {
                self.doneButtonImageView.hidden = false
                newlyCreatedFace.center = CGPoint(x:160,y:280)
            }
            
        } // ended
            
            
            
        else
        {
            
            
            
        }  // else
        
    }
    
    
}

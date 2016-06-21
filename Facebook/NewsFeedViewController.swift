//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
    
    var selectedImageView: UIImageView!
    var imageTransition: ImageTransition!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let photoViewController = segue.destinationViewController as! PhotoViewController
        
        photoViewController.photoImage = selectedImageView.image
        
        //modal presentation
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // fade transition
        imageTransition = ImageTransition()
        
        photoViewController.transitioningDelegate = imageTransition
        
    }
    
    @IBAction func didphotoTap(sender: UITapGestureRecognizer) {
        print("test")
        selectedImageView = sender.view as! UIImageView
        performSegueWithIdentifier("photoSegue", sender: self)
    }
    
    
}

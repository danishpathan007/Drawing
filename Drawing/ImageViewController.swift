//
//  ImageViewController.swift
//  Drawing
//
//  Created by Danish Khan on 17/07/20.
//  Copyright © 2020 Danish Khan. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    var img = UIImage()
    
    
    @IBOutlet weak var captureImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        captureImage.image = img
    }
 

    // share image
    @IBAction func shareImageButton(_ sender: UIBarButtonItem) {

        // set up activity view controller
        let imageToShare = [ img ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash

        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]

        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}

//
//  PolaroidViewController.swift
//  AStarIsBornMask
//
//  Created by Chang Sophia on 3/19/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import UIKit
var ratio = "1:1"

class PolaroidViewController: UIViewController {
    @IBOutlet weak var frameView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var guitarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guitarImageView.image = UIImage(named: newSilhouettes[0])
        posterImageView.mask = guitarImageView
        
    let imageWidth: CGFloat = 414
    if ratio == "1 : 1" {
        
   posterImageView.frame.size.height = imageWidth
   guitarImageView.frame.size.height = imageWidth
        
    } else if ratio == "3:4" {
    posterImageView.frame.size.height = imageWidth / 3 * 4
    guitarImageView.frame.size.height = imageWidth / 3 * 4
    } else {
    posterImageView.frame.size.height = imageWidth / 16 * 9
    guitarImageView.frame.size.height = imageWidth / 16 * 9
    }
    frameView.frame.size.height = posterImageView.frame.maxY + 100
    
    //animation
    
    UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, animations: {
    
    self.frameView.frame = CGRect(x: 20, y: 120, width: self.frameView.frame.width, height: self.frameView.frame.height)
    }, completion: nil)
    
     
}
}



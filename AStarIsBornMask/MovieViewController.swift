//
//  MovieViewController.swift
//  AStarIsBornMask
//
//  Created by Chang Sophia on 3/20/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import UIKit
import AVFoundation

class MovieViewController: UIViewController {
     var player: AVPlayer?
 
    
    @IBOutlet var grayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = grayView.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.lightGray.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
         grayView.layer.addSublayer(gradientLayer)
        
        
        
        let guitarImage = UIImage(named: "guitar1")
        let guitarImageView = UIImageView(image: guitarImage)
        let url = URL(string:"http://movietrailers.apple.com/movies/wb/a-star-is-born/a-star-is-born-trailer-1_h720p.mov")
        
        let player = AVPlayer(url: url!)
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)
        playerLayer.frame = CGRect(origin: CGPoint(x: 10, y: 300), size: guitarImageView.frame.size)
        playerLayer.mask = guitarImageView.layer
        player.play()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

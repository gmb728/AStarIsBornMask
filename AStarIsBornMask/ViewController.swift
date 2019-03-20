//
//  ViewController.swift
//  AStarIsBornMask
//
//  Created by Chang Sophia on 3/18/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import UIKit
 
var newSilhouettes: ArraySlice<String> = []

class ViewController: UIViewController {
   
    @IBOutlet weak var bgImageView: SharpImageView!
    
    @IBOutlet var bgView: UIView!
    @IBOutlet weak var frameView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var guitarButton: UIButton!
    @IBOutlet weak var guitarImageView: UIImageView!
    @IBOutlet weak var pickButton: UIButton!
    @IBOutlet weak var fliterSlider: UISlider!
    
    let silhouettes = ["star", "guitar", "guitar1"]
    
    @IBAction func guitarButtonPressed(_ sender: UIButton) {
        newSilhouettes = silhouettes.shuffled()[0...1]
        guitarImageView.image = UIImage(named: newSilhouettes[0])
        posterImageView.mask = guitarImageView
       
    }
    
    
    
    @IBAction func filterSliderChanged(_ sender: UISlider) {
    //產生CIImage物件
        let image = UIImage(named: "poster")
        let ciImage = CIImage(image: image!)
    //產生製造濾鏡效果的CIFliter物件
        let filter = CIFilter(name: "CIColorMonochrome")
    //設定CIFilter物件
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
    //以slider sender value設定濾鏡強度
        filter?.setValue(sender.value, forKey: kCIInputIntensityKey)
    //濾鏡顏色
        filter?.setValue(CIColor(red: 1, green: 0, blue: 0, alpha: 0.5), forKey: kCIInputColorKey)
    //產生加濾鏡效果的圖片，使用CCIContext function createCGImage(_:from:) 生成 CGImage，傳入的參數 outputImage.extent 代表圖片長方形的位置大小，然後再用 CGImage 生成 UIImage。
        if let outputImage = filter?.outputImage, let cgImage = CIContext().createCGImage(outputImage, from: outputImage.extent){
            let image = UIImage(cgImage: cgImage)
            posterImageView.image = image
        }
        
    }
    
    
  
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    }
    




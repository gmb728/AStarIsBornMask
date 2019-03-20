//
//  SharpImageView.swift
//  AStarIsBornMask
//
//  Created by Chang Sophia on 3/18/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import UIKit

class SharpImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: bounds.width, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x:0, y: bounds.height * 1))
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
        
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

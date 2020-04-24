//
//  CustomView.swift
//  DrawMailer
//
//  Created by Ellie on 4/24/20.
//  Copyright © 2020 Ellie. All rights reserved.
//

import UIKit
import MessageUI

class CustomView: UIView {
    var layers:[Array<CGPoint>] = []
    var layerIndex = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
        self.backgroundColor = UIColor.clear
        print("initWithFrame, will I ever get called?")
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.isOpaque = false
        self.backgroundColor = UIColor.clear
        print("init(coder:) called")
    }

    func createImageFromContext() -> UIImage {
        print("createImageFromContext - dump view contents to image")
        let contextRect = CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height)
        UIGraphicsBeginImageContext(contextRect.size)
        
        // Get whatever the user drew in the view
        layer.render(in: UIGraphicsGetCurrentContext()!)
        
        // Create new image with it
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage!
    }

    func cls() {
        print("cls - clear the screen")
        // Our next layer starts at zero again
        layerIndex = 0
        // Reset the array
        layers .removeAll()
        // Update the view
        setNeedsDisplay()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        print("drawRect - I get called when the view is 'dirty'");
        
        // Get pointer to view
        let context = UIGraphicsGetCurrentContext()
        context?.clear(rect)

        // Loop through the layers if any
        for points in layers {
            // The pen color is white, change if you want
            UIColor.red.set()

            // Set the line width to 3
            context?.setLineWidth( 3.0)

            // Loop through each layer's point values
            if points.count - 1 > 0 {
                for i in 0 ..< points.count-1 {
                    let pt1 = points[i] as CGPoint
                    let pt2 = points[i+1] as CGPoint
                    context?.move(to:pt1)
                    context?.addLine(to: pt2)
                    context?.strokePath()
                }
            }
        }
    }
    
    // On new touch, start a new array (layer) of points
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var points:[CGPoint] = []
        layers.append(points)
        let pt = (touches.first!).location(in: self)
        points.append(pt)
        self.setNeedsDisplay()
    }

    // Add each point to the correct array as the finger moves
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let pt = (touches.first!).location(in: self)
        layers[layerIndex].append(pt)
        self.setNeedsDisplay()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("layer \(layerIndex) now has \(layers[layerIndex].count) ")
        layerIndex += 1
        self.setNeedsDisplay()
    }
}

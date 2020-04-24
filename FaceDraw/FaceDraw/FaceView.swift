//
//  FaceView.swift
//  FaceDraw
//
//  Created by Ellie on 4/24/20.
//  Copyright © 2020 Ellie. All rights reserved.
//

import UIKit

class FaceView: UIView {
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // Get a pointer to the drawing space of the current view
        let ctx = UIGraphicsGetCurrentContext()
        
        // Set the fill color for the drawing we do, it's the area inside of the path
        ctx?.setFillColor(UIColor.red.cgColor)
        
        // Set the stroke color. Strokes follow the path
        ctx?.setStrokeColor(UIColor.purple.cgColor)
        
        // Set the current stroke width
        ctx?.setLineWidth(8.0)
        
        // Fill the entire background
        let bounds = self.bounds
        ctx?.fill(bounds)
        
        // Determine the top left corner to go off of
        // Basing this on a 320 x 480 sized view
        let x = self.bounds.width / 2 - 160
        let y = self.bounds.height / 2 - 240
        
        // Fill and stroke a mouth (rectangle)
        let mouth = CGRect(x: x + 30, y: y + 280, width: 260, height: 95)
        
        // Change the fill color
        ctx?.setFillColor(UIColor.yellow.cgColor)
        
        // Fill just the rectangle with the current drawing color
        ctx?.fill(mouth)
        
        // Draw around the mouth with a different color for the stroke
        ctx?.stroke(mouth)
        
        // Make a nose
        let nose = CGRect(x: x + 150, y: y + 160, width: 20, height: 60)
        ctx?.fill(nose)
        ctx?.stroke(nose)
        
        // Now eyes and pupils
        let leftEye = CGRect(x: x + 40, y: y + 65, width: 75, height: 45)
        ctx?.fillEllipse(in: leftEye)
        ctx?.strokeEllipse(in: leftEye)
        
        let rightEye = CGRect(x: x + 200, y: y + 65, width: 75, height: 45)
        ctx?.fillEllipse(in: rightEye)
        ctx?.strokeEllipse(in: rightEye)
        
        // Another way to set the color
        let blue: [CGFloat] = [0.0, 0.2, 1.0, 1.0]
        ctx?.setFillColor(blue)
        
        // Pupils
        let leftPupil = CGRect(x: x + 75, y: y + 78, width: 20, height: 20)
        ctx?.fillEllipse(in: leftPupil)
        
        let rightPupil = CGRect(x: x + 215, y: y + 78, width: 20, height: 20)
        ctx?.fillEllipse(in: rightPupil)
        
        // Draw teeth
        // Another way to create a color - pick Color Literal then hit enter, double click on swatch and pick color from color picker
        let toothColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1).cgColor
        ctx?.setFillColor(toothColor)
        ctx?.setLineWidth(4.0)
        
        // Points are specified counter clockwise
        ctx?.beginPath()
        ctx?.move(to: CGPoint(x: x + 140, y: y + 282))
        ctx?.addLine(to: CGPoint(x: x + 110, y: y + 282))
        ctx?.addLine(to: CGPoint(x: x + 125, y: y + 330))
        ctx?.closePath()
        ctx?.drawPath(using: .fillStroke)
        
        ctx?.beginPath()
        ctx?.move(to: CGPoint(x: x + 210, y: y + 282))
        ctx?.addLine(to: CGPoint(x: x + 180, y: y + 282))
        ctx?.addLine(to: CGPoint(x: x + 195, y: y + 330))
        ctx?.closePath()
        ctx?.drawPath(using: .fillStroke)
        
        ctx?.beginPath()
        ctx?.move(to: CGPoint(x: x + 230, y: y + 375))
        ctx?.addLine(to: CGPoint(x: x + 250, y: y + 360))
        ctx?.addLine(to: CGPoint(x: x + 270, y: y + 375))
        ctx?.closePath()
        ctx?.drawPath(using: .fillStroke)
        
        ctx?.beginPath()
        ctx?.move(to: CGPoint(x: x + 50, y: y + 375))
        ctx?.addLine(to: CGPoint(x: x + 70, y: y + 360))
        ctx?.addLine(to: CGPoint(x: x + 90, y: y + 375))
        ctx?.closePath()
        ctx?.drawPath(using: .fillStroke)
        
        // Warts
        let wartColor = #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1).cgColor
        ctx?.setFillColor(wartColor)
        
        let leftWart = CGRect(x: x + 20, y: y + 200, width: 20, height: 20)
        ctx?.fillEllipse(in: leftWart)
        ctx?.strokeEllipse(in: leftWart)
        
        let rightWart = CGRect(x: x + 200, y: y + 160, width: 20, height: 20)
        ctx?.fillEllipse(in: rightWart)
        ctx?.strokeEllipse(in: rightWart)
    }
}

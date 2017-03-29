//
//  AxisView.swift
//  messingAround
//
//  Created by Bhairavi Chandersekhar on 1/1/17.
//  Copyright © 2017 Bhairavi Chandersekhar. All rights reserved.
//

import UIKit
import CoreGraphics

class AxisView: UIView {
    
    var tasks: [Task]!
    
    override func draw(_ rect: CGRect) {
        drawAxes(rect)
        drawTriangles(rect)
        drawTasks(rect)
        
        let urgentString: NSString = "URGENCY"
        let fieldColor: UIColor = UIColor.black
        let fieldFont = UIFont(name: "SFUIDisplay-Semibold", size: 15)
        let attributes: [String: Any] = [
            NSForegroundColorAttributeName: fieldColor,
            NSFontAttributeName: fieldFont!,
            NSKernAttributeName: 1.3
        ]
        urgentString.draw(in: CGRect(x: bounds.width/2 - 20, y: bounds.height - 30, width: 80, height: 40), withAttributes: attributes)
        
        let importanceLabel = importanceLabelView(frame: CGRect(x: 12, y: bounds.height/2 - 50, width: 20, height: 100))
        importanceLabel.attributedText = NSMutableAttributedString(string: "IMPORTANCE", attributes: attributes)
        
        self.addSubview(importanceLabel)
        /* let importanceStringLabel = CATextLayer()
        let importanceString = "IMPORTANCE"
        let importanceString = NSMutableAttributedString(string: "IMPORTANCE")
        importanceString.addAttribute(NSKernAttributeName, value: 1.3, range: NSRange(location: 0, length: importanceString.length))
        importanceStringLabel.string = importanceString
        importanceStringLabel.font = UIFont(name: "SFUIDisplay-Semibold", size: 15)
        importanceStringLabel.foregroundColor = UIColor.black.cgColor
        importanceStringLabel.anchorPoint = CGPoint(x: 20, y: bounds.height/2)
        importanceStringLabel.transform = CATransform3DMakeRotation(CGFloat.pi/2, 0, 0, 0)
        importanceStringLabel.draw(in: UIGraphicsGetCurrentContext()!)
        UIGraphicsGetCurrentContext()!.
            //CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
        let importanceString: NSString = "IMPORTANT"
        let fieldColor2: UIColor = UIColor.black
        let fieldFont2 = UIFont(name: "SFUIDisplay-Semibold", size: 15)
        let attributes2 = [
            NSForegroundColorAttributeName: fieldColor2,
            NSFontAttributeName: fieldFont2!,
            NSKernAttributeName: 1.3
        ] as [String: Any]
        importanceString.draw(at: CGPoint(x: 20, y: bounds.height/2), withAttributes: attributes2)
        let context = UIGraphicsGetCurrentContext()
        context.anchorPoint = CGPoint(x: 20, y: bounds.height/2) */
    }
    
    func drawTasks(_ rect: CGRect) {
        //redraws tasks when u return to axis view
        //if new task (how to check for that..?)
        //-->drop in the middle 
        //user drags to desired spot
        var urg : Float = 0
        var imp = 0
        tasks = Task.allTasks
        if tasks != nil {
           for task in tasks {
            var taskImage : UIImage
                switch task.category {
                case "Work": taskImage = UIImage(named: "redCircle.png")!
                case "Wellness": taskImage = UIImage(named: "blueCircle.png")!
                default: taskImage = UIImage(named: "redCircle.png")!
                }
            urg = task.makeUrgency()
            imp = task.makeImportance()
            let taskView = TaskView(image: taskImage, urgency: urg, importance: imp)
            taskView.draw(self)
            }
        }
    }
    
    func drawAxes(_ rect: CGRect) {
        let xAxis = UIBezierPath()
        xAxis.move(to: CGPoint(x:44, y:bounds.height - 40))
        xAxis.addLine(to: CGPoint(x:bounds.width - 15, y:bounds.height - 40 ))
        xAxis.close()
        xAxis.lineWidth = 3.0
        xAxis.stroke()

        let yAxis = UIBezierPath()
        yAxis.move(to: CGPoint(x:45, y:15))
        yAxis.addLine(to: CGPoint(x:45, y:bounds.height - 40 ))
        yAxis.close()
        UIColor.black.set()
        yAxis.lineWidth = 3.0
        yAxis.stroke()
    }
    
    func drawTriangles(_ rect: CGRect) {
        let xTriangle = UIBezierPath()
        xTriangle.move(to: CGPoint(x:bounds.width - 25, y:bounds.height - 35))
        xTriangle.addLine(to: CGPoint(x:bounds.width - 25, y:bounds.height - 45 ))
        xTriangle.addLine(to: CGPoint(x:bounds.width - 10, y:bounds.height - 40))
        xTriangle.addLine(to: CGPoint(x:bounds.width - 25, y:bounds.height - 35))
        xTriangle.close()
        xTriangle.stroke()
        xTriangle.fill()
        
        let yTriangle = UIBezierPath()
        yTriangle.move(to: CGPoint(x:40, y:25))
        yTriangle.addLine(to: CGPoint(x:50, y:25))
        yTriangle.addLine(to: CGPoint(x:45, y: 10))
        yTriangle.addLine(to: CGPoint(x:40, y:25))
        yTriangle.close()
        yTriangle.stroke()
        yTriangle.fill()
    }
}


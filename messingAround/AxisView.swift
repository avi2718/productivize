//
//  AxisView.swift
//  messingAround
//
//  Created by Bhairavi Chandersekhar on 1/1/17.
//  Copyright © 2017 Bhairavi Chandersekhar. All rights reserved.
//

import UIKit

class AxisView: UIView {
    
    var tasks: [Task]!
    
    override func draw(_ rect: CGRect) {
        drawAxes(rect)
        drawTriangles(rect)
        
        let urgentString: NSString = "URGENT"
        let fieldColor: UIColor = UIColor.black
        let fieldFont = UIFont(name: "SFUIDisplay-Semibold", size: 15)
        let attributes: NSDictionary = [
            NSForegroundColorAttributeName: fieldColor,
            NSFontAttributeName: fieldFont!,
            NSKernAttributeName: 1.3
        ]
        urgentString.draw(in: CGRect(x: bounds.width/2 - 20, y: bounds.height - 30, width: 80, height: 30), withAttributes: attributes as? [String : Any])
        
        
        /* let importanceString: NSString = "IMPORTANT"
        let fieldColor2: UIColor = UIColor.black
        let fieldFont2 = UIFont(name: "SFUIDisplay-Semibold", size: 15)
        let attributes2: NSDictionary = [
            NSForegroundColorAttributeName: fieldColor2,
            NSFontAttributeName: fieldFont2!,
            NSKernAttributeName: 1.3
        ]
        importanceString.draw(at: CGPoint(x: 20, y: bounds.height/2), withAttributes: attributes2 as? [String: Any]) */
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


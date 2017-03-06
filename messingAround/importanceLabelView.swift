//
//  importanceLabelView.swift
//  messingAround
//
//  Created by Bhairavi Chandersekhar on 2/11/17.
//  Copyright © 2017 Bhairavi Chandersekhar. All rights reserved.
//

import Foundation
import UIKit

class importanceLabelView: UIView{
    //this is a change
    //this is a second change
    
    static let rotateVertically: CGAffineTransform = {
        let trans = CGAffineTransform()
        trans.rotated(by: CGFloat.pi/2)
        return trans
    }()
    
    private func drawVerticalString(str: String, x: CGFloat, y: CGFloat) {
        let fieldColor: UIColor = UIColor.black
        let fieldFont = UIFont(name: "SFUIDisplay-Semibold", size: 15)
        let attributes: NSDictionary = [
            NSForegroundColorAttributeName: fieldColor,
            NSFontAttributeName: fieldFont!,
            NSKernAttributeName: 1.3
        ]
        
        let context = UIGraphicsGetCurrentContext()
        context!.saveGState()
        let strRect = (str as NSString).boundingRect(with: CGSize(width: frame.height, height: frame.height), options: NSStringDrawingOptions.truncatesLastVisibleLine, attributes: nil, context: nil)
        let nx = y
        let ny = -x - (strRect.size.height / 2)
        //importanceLabelView.rotateVertically
        (str as NSString).draw(at: CGPoint(x: nx, y: ny), withAttributes: attributes as? [String : Any])
        context!.restoreGState()
    }
    
    override func draw(_ rect: CGRect) {
        drawVerticalString(str: "Importance!", x: 30, y: 150)
    }
}


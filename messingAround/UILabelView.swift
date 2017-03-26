//
//  UILabelView.swift
//  messingAround
//
//  Created by Natalie on 3/26/17.
//  Copyright © 2017 Bhairavi Chandersekhar. All rights reserved.
//

import UIKit

class UILabelView : UILabel {
    
    override func draw(_ rect: CGRect) {
        guard let text = self.text else {
            return
        }
        
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        
        let transform = CGAffineTransform(
            
            rotationAngle: CGFloat(-M_PI_2))
        context!.concatenate(transform)
        context!.translateBy(x: -rect.size.height, y: 0)
        
        var newRect = rect.applying(transform)
        newRect.origin = CGPoint(x: 0, y: 0)
        
        let textStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        textStyle.lineBreakMode = self.lineBreakMode
        textStyle.alignment = self.textAlignment
        
        let attributeDict: [String:AnyObject] = [
            NSFontAttributeName: self.font,
            NSForegroundColorAttributeName: self.textColor,
            NSParagraphStyleAttributeName: textStyle,
            ]
        
        let nsStr = text as NSString
        nsStr.draw(in: newRect, withAttributes: attributeDict)
    }

}

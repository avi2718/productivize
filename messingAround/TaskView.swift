//
//  TaskView.swift
//  messingAround
//
//  Created by Bhairavi Chandersekhar on 3/13/17.
//  Copyright © 2017 Bhairavi Chandersekhar. All rights reserved.
//

import UIKit

class TaskView { //: UIImageView {
    //var task: Task
    var imageView: UIImageView
    var urgency: Float
    var importance: Int
    
    var dragStartPositionRelativeToCenter : CGPoint?
    
    init(image: UIImage!, urgency: Float, importance: Int) { // _ task : Task
        //self.task = task
        self.imageView = UIImageView(image: image)
        self.urgency = urgency
        self.importance = importance
    }
    //super.init(image: image, urgency: urgency, importance: importance)
    /*switch task.category {
     case "Work": imageView = UIImageView(image: UIImage(named: "redCircle.png"))
     case "Wellness": imageView = UIImageView(image: UIImage(named: "blueCircle.png"))
     default: imageView = UIImageView(image: UIImage(named: "redCircle.png"))
     }
     self.isUserInteractionEnabled = true   //< w00000t!!!1
     
     //#selector(self.handlePan(_:))
     
     let hp = UIPanGestureRecognizer(target: self, action: "handlePan")
     addGestureRecognizer(hp)
     
     
     }
     
     required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
     }
     
     func handlePan(_ sender: UIPanGestureRecognizer!) {
     print("is it even!")
     if sender.state == UIGestureRecognizerState.began {
     let locationInView = sender.location(in: superview)
     dragStartPositionRelativeToCenter = CGPoint(x: locationInView.x - center.x, y: locationInView.y - center.y)
     
     return
     }
     
     if sender.state == UIGestureRecognizerState.ended {
     dragStartPositionRelativeToCenter = nil
     
     return
     }
     
     let locationInView = sender.location(in: superview)
     
     UIView.animate(withDuration: 0.1) {
     self.center = CGPoint(x: locationInView.x - self.dragStartPositionRelativeToCenter!.x,
     y: locationInView.y - self.dragStartPositionRelativeToCenter!.y)
     }
     }*/
    
    func makeX(_ parentView: UIView) -> Int{
        //urgency
        return Int(parentView.bounds.width / 2400 * CGFloat(urgency)) + 45
    }
    
    func makeY(_ parentView: UIView) -> Int{
        //importance
        return Int(parentView.bounds.height / 3 * CGFloat(importance))
    }
    
    func draw(_ parentView: UIView) {
        
        let xCoor = makeX(parentView)
        let yCoor = makeY(parentView)
        imageView.frame = CGRect(x: xCoor, y: yCoor, width: 15, height: 15)
        parentView.addSubview(imageView)
    }
    
}

//
//  TaskView.swift
//  messingAround
//
//  Created by Bhairavi Chandersekhar on 3/13/17.
//  Copyright © 2017 Bhairavi Chandersekhar. All rights reserved.
//

import UIKit

class TaskView : UIImageView {
    //var task: Task
    var imageView: UIImageView
    
    var dragStartPositionRelativeToCenter : CGPoint?
    
    override init(image: UIImage!) { // _ task : Task
        //self.task = task
        self.imageView = UIImageView(image: image)
        
        super.init(image: image)
        /*switch task.category {
        case "Work": imageView = UIImageView(image: UIImage(named: "redCircle.png"))
        case "Wellness": imageView = UIImageView(image: UIImage(named: "blueCircle.png"))
        default: imageView = UIImageView(image: UIImage(named: "redCircle.png"))
        }*/
        
       let hp = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
        addGestureRecognizer(hp)
        
        self.isUserInteractionEnabled = true   //< w00000t!!!1
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer!) {
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
    }
    
    func draw(_ parentView: UIView) {
        imageView.frame = CGRect(x: 5, y: 5, width: 15, height: 15)
        parentView.addSubview(imageView)
    }
    
}

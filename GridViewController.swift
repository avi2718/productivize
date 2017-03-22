//
//  GridViewController.swift
//  messingAround
//
//  Created by Bhairavi Chandersekhar on 12/21/16.
//  Copyright © 2016 Bhairavi Chandersekhar. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {
    
    var axisview: AxisView!
    
    /*@IBAction func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let translation = gestureRecognizer.translation(in: self.view)
            // note: 'view' is optional and need to be unwrapped
            gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
        }
 
    
    var dragStartPositionRelativeToCenter : CGPoint?

    
    func handlePan(nizer: UIPanGestureRecognizer!) {
        if nizer.state == UIGestureRecognizerState.began {
            let locationInView = nizer.location(in: axisview)
            dragStartPositionRelativeToCenter = CGPoint(x: locationInView.x - center.x, y: locationInView.y - center.y)
            
            return
        }
        
        if nizer.state == UIGestureRecognizerState.ended {
            dragStartPositionRelativeToCenter = nil
            

            return
        }
        
        let locationInView =  nizer.location(in: axisview)
        
        UIView.animateWithDuration(0.1) {
            self.center = CGPoint(x: locationInView.x - self.dragStartPositionRelativeToCenter!.x,
                                  y: locationInView.y - self.dragStartPositionRelativeToCenter!.y)
        }
    }}*/

    
    override func viewDidLoad() {
        super.viewDidLoad()
         
      //  let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
     //   self.someDraggableView.addGestureRecognizer(gestureRecognizer)
    }
}

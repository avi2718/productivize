//
//  GridViewController.swift
//  messingAround
//
//  Created by Bhairavi Chandersekhar on 12/21/16.
//  Copyright © 2016 Bhairavi Chandersekhar. All rights reserved.
//

import UIKit

class GridViewController: UIViewController {
    @IBAction func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let translation = gestureRecognizer.translation(in: self.view)
            // note: 'view' is optional and need to be unwrapped
            gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
        }
    }
    
    override func viewDidLoad() {
      //  let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
     //   self.someDraggableView.addGestureRecognizer(gestureRecognizer)
    }
}

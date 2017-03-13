//
//  TaskView.swift
//  messingAround
//
//  Created by Bhairavi Chandersekhar on 3/13/17.
//  Copyright © 2017 Bhairavi Chandersekhar. All rights reserved.
//

import UIKit

class TaskView{
    var task: Task
    var imageView: UIImageView
    
    init(_ task: Task) {
        self.task = task
        imageView = UIImageView(image: UIImage(named: "redCircle.png"))
    }
    
    func draw(_ parentView: UIView) {
        imageView.frame = CGRect(x: 5, y: 5, width: 15, height: 15)
        parentView.addSubview(imageView)
    }
    
}

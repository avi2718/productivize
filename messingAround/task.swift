//
//  task.swift
//  messingAround
//
//  Created by Bhairavi Chandersekhar on 12/21/16.
//  Copyright © 2016 Bhairavi Chandersekhar. All rights reserved.
//

import Foundation

struct Task: CustomStringConvertible, Hashable {
    var name: String
    var category: String
    var length: Int //use timePicker
    var minChunk: Int //use timePicker
    var importance: Int
    var urgency: Int
    
    init(xCoor: Int, yCoor: Int, name: String, category: String, length: Int, minChunk: Int) {
        importance = xCoor
        urgency = yCoor
        self.name = name
        self.category = category
        self.length = length
        self.minChunk = minChunk
    }
    
    var hashValue: Int {
        return 100000 * urgency + 100 * importance
    }
    
    var description: String {
        return name
    }
    
}

func == (t1: Task, t2: Task) -> Bool {
    return t1.name == t2.name
}

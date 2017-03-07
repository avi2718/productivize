//
//  task.swift
//  messingAround
//
//  Created by Bhairavi Chandersekhar on 12/21/16.
//  Copyright © 2016 Bhairavi Chandersekhar. All rights reserved.
//

import Foundation

struct Task: CustomStringConvertible, Hashable {
    static var allTasks: [Task] = []
    var name: String
    var dueDate: Date
    var category: String
    var length: TimeInterval
    var minChunk: TimeInterval
    var importance: Int
    var urgency: Int
    
    init(xCoor: Int, yCoor: Int, name: String, dueDate: Date, category: String, length: TimeInterval, minChunk: TimeInterval) {
        importance = xCoor
        urgency = yCoor
        self.name = name
        self.dueDate = dueDate
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

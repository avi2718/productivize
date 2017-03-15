//
//  taskList.swift
//  messingAround
//
//  Created by Natalie on 3/15/17.
//  Copyright © 2017 Bhairavi Chandersekhar. All rights reserved.
//

import UIKit

class TaskList {
    
    var allTasks = [Task]()
    
    func createTask() -> Task {
        let t : TimeInterval = 0
        let c : TimeInterval = 0
        let newTask = Task(xCoor: 50, yCoor: 50, name: "", dueDate: Date.distantFuture, category: "", length: t, minChunk: c)
        
        allTasks.append(newTask)
        
        return newTask
    }
}


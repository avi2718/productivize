//
//  taskList.swift
//  messingAround
//
//  Created by Natalie on 3/15/17.
//  Copyright © 2017 Bhairavi Chandersekhar. All rights reserved.
//

import UIKit

struct TaskList {
    var allTasks: [Task]
    var selectedTasks: Dictionary<String, String> = [:]
    var goalLength: TimeInterval
    
    init(time: TimeInterval) {
        self.allTasks = Task.allTasks
        
        goalLength = time
        
        var currentLength = TimeInterval(0)
        
        var taskIndex = 1
        var orderedTasks = [Task]()
        
        func makeTaskList(task: Task)-> Int{
            var urg = 0
            var imp = 0
            //ughhhhh olay so compare importance and urgency so x and y so
            //add x + y for each... if == --> choose one with longer mininterval to be first
            urg = Int(task.makeUrgency())
            imp = task.makeImportance()
            return urg + imp
        }

        for task in allTasks {
            if orderedTasks.count == 0 {
                orderedTasks = [task]
            } else {
                for i in 0..<(orderedTasks.count - 1) {
                    if makeTaskList(task: orderedTasks[i]) < makeTaskList(task: task) {
                        orderedTasks.insert(task, at: i)
                    }
                    if makeTaskList(task: orderedTasks[i]) == makeTaskList(task: task) {
                        if orderedTasks[i].minChunk > task.minChunk {
                            orderedTasks.insert(task, at: i + 1)
                        } else {
                            orderedTasks.insert(task, at: i)
                        }
                    }
                }
                var check = 0
                for t in orderedTasks {
                    if t == task {
                        check = 1
                    }
                }
                if check == 0{
                    orderedTasks.append(task)
                }
            }
        }
        // now we have an orderedTasks array where everything is organized by SOME variable or other ?
        
        for task in orderedTasks where currentLength + task.minChunk <= goalLength {
            let minutes = (Int(task.minChunk) / 60) % 60
            let hours = Int(task.minChunk) / 3600
            let timeString = "\(hours) hrs \(minutes) min"
            
            let nameString = "\(taskIndex)) \(task.name)"
            currentLength += task.length
            taskIndex += 1
            
            selectedTasks[nameString] = timeString
        }
        
        

    }
    
    mutating func update() {
        let newtaskList = TaskList(time: goalLength)
        self = newtaskList
    }
}


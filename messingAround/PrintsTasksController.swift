//
//  PrintsTasksControllerViewController.swift
//  messingAround
//
//  Created by Bhairavi Chandersekhar on 3/27/17.
//  Copyright © 2017 Bhairavi Chandersekhar. All rights reserved.
//

import UIKit

class PrintsTasksController: UIViewController {

    @IBOutlet var time: UIDatePicker!
    @IBOutlet var printButton: UIButton!
    
    @IBAction func printButtonPushed(_ sender: Any) {
        let goalLength = time.countDownDuration
        
        var currentLength = TimeInterval(0)
        
        var theString = "\n\nTaks:\n"
        var minutes = 0
        var hours = 0
        var timeString = ""
        
        var taskIndex = 1
        var tasksToDoNow = [Task]()
        for task in Task.allTasks {
            if tasksToDoNow.count == 0 {
                tasksToDoNow = [task]
            } else {
                for i in 0..<(tasksToDoNow.count - 1) {
                    if makeTaskList(task: tasksToDoNow[i]) < makeTaskList(task: task) {
                        tasksToDoNow.insert(task, at: i)
                    }
                    if makeTaskList(task: tasksToDoNow[i]) == makeTaskList(task: task) {
                        if tasksToDoNow[i].minChunk > task.minChunk {
                            tasksToDoNow.insert(task, at: i + 1)
                        } else {
                            tasksToDoNow.insert(task, at: i)
                        }
                    }
                }
                var check = 0
                for t in tasksToDoNow {
                    if t == task {
                        check = 1
                    }
                }
                if check == 0{
                    tasksToDoNow.append(task)
                }
            }
        }
        //print("\(tasksToDoNow)")
        for task in tasksToDoNow where Double(makeTime(time: currentLength) + makeTime(time: task.minChunk)) <= goalLength {
            minutes = (Int(task.minChunk) / 60) % 60
            hours = Int(task.minChunk) / 3600
            timeString = "\(hours)hrs \(minutes) min"
            
            theString += "\(taskIndex)) \t \(task.name) for \(timeString) \n"
            currentLength += task.length
            taskIndex += 1
        }
        theString += "\nGood Luck!"
        print(theString)
    }
    
    func makeTime(time: TimeInterval)-> Float{
        let interval = Int(time)
        let minutes : Float = Float((interval / 60) % 60)
        let hours = Float(interval / 3600 * 100)
        let total = hours + minutes
        return total
    }
    
    func makeTaskList(task: Task)-> Int{
        var urg = 0
        var imp = 0
        //ughhhhh olay so compare importance and urgency so x and y so
        //add x + y for each... if == --> choose one with longer mininterval to be first
        urg = Int(task.makeUrgency())
        imp = task.makeImportance()
        return urg + imp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

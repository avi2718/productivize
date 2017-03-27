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
        
        var theString = ""
        
        var taskIndex = 1
        for task in Task.allTasks where (currentLength + task.length) <= goalLength {
            theString += "\(taskIndex) \t \(task.name) for \(task.length) minutes \n"
            currentLength += task.length
            taskIndex += 1
        }
        
        print(theString)
        
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

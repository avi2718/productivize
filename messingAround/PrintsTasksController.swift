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
        
        let taskList = TaskList(time: goalLength)
        print(taskList.selectedTasks)
    }
    
    /* func makeTime(time: TimeInterval)-> Float{
        let interval = Int(time)
        let minutes : Float = Float((interval / 60) % 60)
        let hours = Float(interval / 3600 * 100)
        let total = hours + minutes
        return total
    }*/
    
    /* func makeTaskList(task: Task)-> Int{
        var urg = 0
        var imp = 0
        //ughhhhh olay so compare importance and urgency so x and y so
        //add x + y for each... if == --> choose one with longer mininterval to be first
        urg = Int(task.makeUrgency())
        imp = task.makeImportance()
        return urg + imp
    } */
   /*
    func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

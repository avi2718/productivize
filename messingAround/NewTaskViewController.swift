//
//  NewTaskViewController.swift
//  messingAround
//
//  Created by Bhairavi Chandersekhar on 3/1/17.
//  Copyright © 2017 Bhairavi Chandersekhar. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var dateField: UITextField!
    @IBOutlet var categoryField: UITextField!
    @IBOutlet var lengthField: UITextField!
    @IBOutlet var minChunkField: UITextField!
    @IBOutlet var completionSlider: UISlider!
    @IBOutlet var remainderField: UITextField!
    
    var categories = ["Work", "Wellness"]
    
    var name: String = " "
    var dueDate = Date()
    var category: String = " "
    var taskLength: TimeInterval = 0.0
    var minChunk: TimeInterval = 0.0
    var axis = AxisView()
    
    override func viewDidLoad() {
        self.navigationItem.title = "New Task"
        
        let datePicker  : UIDatePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.date
        dateField.inputView = datePicker
        
        let catPicker = UIPickerView()
        categoryField.inputView = catPicker
        catPicker.dataSource = self
        catPicker.delegate = self
        
        let lengthPicker = UIDatePicker()
        lengthPicker.datePickerMode = UIDatePickerMode.countDownTimer
        lengthField.inputView = lengthPicker
        
        let minChunkPicker = UIDatePicker()
        minChunkPicker.datePickerMode = UIDatePickerMode.countDownTimer
        minChunkField.inputView = minChunkPicker
    }
    
    @IBAction func dateTapped(_ sender: UITextField) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let myDatePicker = sender.inputView as? UIDatePicker
        dueDate = myDatePicker!.date
        dateField.text = dateFormatter.string(from: dueDate)
    }
 
    
    @IBAction func catTapped(_ sender: UITextField) {
        let myCatPicker = sender.inputView as? UIPickerView
        category = categories[(myCatPicker?.selectedRow(inComponent: 0))!]
        categoryField.text = category
    }
    
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }

    @IBAction func lengthTapped(_ sender: UITextField) {
        let myTimePicker = sender.inputView as! UIDatePicker
        lengthField.text = stringFromTimeInterval(interval: myTimePicker.countDownDuration)
        taskLength = myTimePicker.countDownDuration
    }

    func stringFromTimeInterval(interval: TimeInterval) -> String {
        
        let ti = NSInteger(interval)
        let minutes = (ti / 60) % 60
        let hours = (ti / 3600)
        
        //return NSString(format: "%0.2d:%0.2d:%0.2d.%0.3d",hours,minutes,seconds,ms)
        return "\(hours) hours \(minutes) minutes"
    }
    
    @IBAction func chunkTapped(_ sender: UITextField) {
        let myTimePicker = sender.inputView as! UIDatePicker
        minChunk = myTimePicker.countDownDuration
        minChunkField.text = stringFromTimeInterval(interval: minChunk)
    }
    @IBAction func sliderSlid(_ sender: UISlider) {
        remainderField.text = stringFromTimeInterval(interval: (taskLength * Double(1-sender.value)))
    }
    
    @IBAction func newTaskAction(_ sender: UIButton) {
        let _ = self.navigationController?.popViewController(animated: true)
        let myTask = Task(name: nameField.text!, dueDate: dueDate, category: category, length: taskLength, minChunk: minChunk)
        //print(myTask.name)
        Task.allTasks.append(myTask)
        //axis.tasks.append(myTask)
        /*for task in Task.allTasks {
            print(task.name)
        }*/
        axis.setNeedsDisplay()
    }

}

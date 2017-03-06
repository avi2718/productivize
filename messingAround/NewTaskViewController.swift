//
//  NewTaskViewController.swift
//  messingAround
//
//  Created by Bhairavi Chandersekhar on 3/1/17.
//  Copyright © 2017 Bhairavi Chandersekhar. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var dateField: UITextField!
    @IBOutlet var categoryField: UITextField!
    @IBOutlet var lengthField: UITextField!
    @IBOutlet var minChunkField: UITextField!
    @IBOutlet var completionSlider: UISlider!
    @IBOutlet var remainderField: UITextField!
    
    override func viewDidLoad() {
        print("hi)")
        self.navigationItem.title = "New Task"
        
        let datePicker  : UIDatePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.date
        dateField.inputView = datePicker
        
        let catPicker = UIPickerView()
        categoryField.inputView = catPicker
        
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
        //dateField.text = dateFormatter.string(from: sender.date)
    }
    
    
    @IBAction func lengthTapped(_ sender: UITextField) {
        let timePickerView  : UIDatePicker = UIDatePicker()
        timePickerView.datePickerMode = UIDatePickerMode.countDownTimer
        sender.inputView = timePickerView
        //timePickerView.addTarget(self, action: Selector(("handleTimePicker:")), for: UIControlEvents.valueChanged)
    }
    
    func handleTimePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateField.text = dateFormatter.string(from: sender.date)
    }
    
    
    @IBAction func newTaskAction(_ sender: UIBarButtonItem) {
        let _ = self.navigationController?.popViewController(animated: true)
    }

    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        let _ = self.navigationController?.popViewController(animated: true)
    }
}

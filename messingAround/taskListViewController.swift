//
//  taskListViewController.swift
//  messingAround
//
//  Created by Natalie on 3/15/17.
//  Copyright © 2017 Bhairavi Chandersekhar. All rights reserved.
//

import UIKit

class taskListViewController: UITableViewController {
    
    var taskList: TaskList!
    
    
    func getTasks() {
        //needs tasks from grid....
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Task.allTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        let taskName = Array(taskList.selectedTasks.keys)[indexPath.row]
        let taskLength = taskList.selectedTasks[taskName]
        
        cell.textLabel?.text = taskName
        cell.detailTextLabel?.text = taskLength
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        taskList.update()
    }
}

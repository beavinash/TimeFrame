//
//  HomeViewController.swift
//  TimeFrame
//
//  Created by Avinash Reddy on 1/17/17.
//  Copyright © 2017 theEine. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [TaskTimeFrame] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = createTasks()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func createTasks() -> [TaskTimeFrame] {
        let task1 = TaskTimeFrame()
        task1.name = "Walk"
        task1.timeFrame = "2AM"
        task1.important = false
        
        let task2 = TaskTimeFrame()
        task2.name = "Talk"
        task2.timeFrame = "3AM"
        task2.important = true
        
        let task3 = TaskTimeFrame()
        task3.name = "Walk the Talk"
        task3.timeFrame = "4AM"
        task3.important = false
        
        return [task1, task2, task3]
    }

    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_ADD, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousVC = self // for getting back data
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


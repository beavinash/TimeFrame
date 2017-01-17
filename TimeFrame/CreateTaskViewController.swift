//
//  CreateTaskViewController.swift
//  TimeFrame
//
//  Created by Avinash Reddy on 1/17/17.
//  Copyright © 2017 theEine. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var timeFrameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    // For sending the data
    var previousVC = HomeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        // Create a Task using Time Frame with outlets
        let task = TaskTimeFrame()
        task.name = taskNameTextField.text!
        task.timeFrame = timeFrameTextField.text!
        task.important = importantSwitch.isOn
        
        // Add data to array and send back data to HomeViewController
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        
        navigationController!.popViewController(animated: true)
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

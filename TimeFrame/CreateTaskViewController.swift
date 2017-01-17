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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Tap to hide keyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateTaskViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        // Check Data
        if (!checkInput()) {
            return
        }
        
        // Create a Task using Time Frame with outlets
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = TaskTimeFrame(context: context)
        task.name = taskNameTextField.text!
        task.timeFrame = timeFrameTextField.text!
        task.important = importantSwitch.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext() // for saving above object
        
        // Add data to array and send back data to HomeViewController
//        previousVC.tasks.append(task)
//        previousVC.tableView.reloadData()
        
        navigationController!.popViewController(animated: true) // pop back
    }
    
    func checkInput() -> Bool {
        // Task Name Check
        if ((taskNameTextField.text?.characters.count)! < 3) {
            taskNameTextField.backgroundColor = UIColor.init(red: 0.8, green: 0.0, blue: 0.0, alpha: 0.2)
            Utilities().ShowAlert(title: "Error!", message: "The Name entered should be more than 2 Characters", vc: self)
            return false
        } else {
            taskNameTextField.backgroundColor = UIColor.white
        }
        
        // Time Frame Check
        if ((timeFrameTextField.text?.characters.count)! <= 18) {
            timeFrameTextField.backgroundColor = UIColor.init(red: 0.8, green: 0.0, blue: 0.0, alpha: 0.2)
            Utilities().ShowAlert(title: "Error!", message: "The Time Frame entered should be in exact Format", vc: self)
            return false
        } else {
            timeFrameTextField.backgroundColor = UIColor.white
        }
        
        return true
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

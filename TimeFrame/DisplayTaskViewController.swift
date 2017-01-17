//
//  DisplayTaskViewController.swift
//  TimeFrame
//
//  Created by Avinash Reddy on 1/17/17.
//  Copyright © 2017 theEine. All rights reserved.
//

import UIKit

class DisplayTaskViewController: UIViewController {
    
    var task: TaskTimeFrame? = nil
//    var previousVC = HomeViewController()

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var timeFrameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if task!.important {
            taskLabel.text = "❗️\(task!.name!)"
        } else {
            taskLabel.text = task!.name!
        }
        timeFrameLabel.text = task!.timeFrame!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func completeTapped(_ sender: Any) {
//        previousVC.tasks.remove(at: previousVC.selectedIndex)
//        previousVC.tableView.reloadData()
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
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

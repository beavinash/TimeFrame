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
    
    // var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
        
        getTasks()
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tasks.count == 0 {
            return 1
        } else {
            return tasks.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if tasks.count == 0 {
            cell.textLabel?.text = "Hey, there are no Time Frames for now"
        } else {
            
            let task = tasks[indexPath.row]
            
            if task.important {
                cell.textLabel?.text = "❗️\(task.name!)"
            } else {
                cell.textLabel?.text = task.name!
            }
            
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // selectedIndex = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: SEGUE_SELECT, sender: task)
    }

    @IBAction func addTapped(_ sender: Any) {
        performSegue(withIdentifier: SEGUE_ADD, sender: nil)
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(TaskTimeFrame.fetchRequest()) as! [TaskTimeFrame]
            // print(tasks)
        } catch {
            print("We have Error")
            Utilities().ShowAlert(title: "Error!", message: "Core Data Error! Please Try Again!", vc: self)
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SEGUE_SELECT {
            let nextVC = segue.destination as! DisplayTaskViewController
            nextVC.task = sender as? TaskTimeFrame
            // nextVC.previousVC = self
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


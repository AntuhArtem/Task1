//
//  TaskTableViewController.swift
//  Task1
//
//  Created by Antyukh, Artjom on 10/26/18.
//  Copyright © 2018 Artem Antuh. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    
@IBAction func pushTaskRefresh(_ sender: Any) {
        tableView.reloadData()
    }
    
    
    @IBAction func pushTaskEdit(_ sender: Any) {
        tableView.setEditing(!(tableView.isEditing), animated: true)
    }
    
    
    @IBAction func pushTaskAdd(_ sender: Any) {
        let taskAlertController = UIAlertController(title: "Новая задача", message: "", preferredStyle: .alert)
        taskAlertController.addTextField { (textField) in
            textField.placeholder = "Заголовок"
            
            taskAlertController.addTextField(configurationHandler: { (textField) in
                textField.placeholder = "Рабочие часы"
                //change rows
                taskAlertController.addTextField(configurationHandler: { (textField) in
                    textField.placeholder = "Дата начала"
                    
                    taskAlertController.addTextField(configurationHandler: { (textField) in
                        textField.placeholder = "Дата кончания"
                        
                        taskAlertController.addTextField(configurationHandler: { (textField) in
                            textField.placeholder = "Статус"
                            //until here
                        })
                    })
                })
            })
        }
        
        let taskAlertAction1 = UIAlertAction(title: "Отмена", style: .default) { (alert) in
        }
        let taskAlertAction2 = UIAlertAction(title: "Добавить", style: .cancel) { (alert) in
            let newTaskItem = taskAlertController.textFields![0].text
            addTaskItem(nameTaskItem: newTaskItem!)
            self.tableView.reloadData()
        }
        
        taskAlertController.addAction(taskAlertAction1)
        taskAlertController.addAction(taskAlertAction2)
        present(taskAlertController, animated: true, completion: nil)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)

        // Configure the cell...
        let currentItem = taskItems[indexPath.row]
        cell.textLabel?.text = currentItem["Name"] as? String
        
        if (currentItem["isCompleted"] as? Bool) == true {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    //----------------------- DELETE ---------------------------//
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            removeTaskItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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

//
//  ProjectTableViewController.swift
//  Task1
//
//  Created by Artem Antuh on 10/25/18.
//  Copyright © 2018 Artem Antuh. All rights reserved.
//

import UIKit

class ProjectTableViewController: UITableViewController {

    
    @IBAction func pushProjectEdit(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    
    @IBAction func pushProjectRefresh(_ sender: Any) {
        tableView.reloadData()
    }
    
    @IBAction func pushProjectAdd(_ sender: Any) {
        let projectAlertController = UIAlertController(title: "Новый проект", message: "", preferredStyle: .alert)
        projectAlertController.addTextField { (textField) in
            textField.placeholder = "Полное название"
        projectAlertController.addTextField { (textField) in
            textField.placeholder = "Сокращенное"
            }
        }
        
        let projectAlertAction1 = UIAlertAction(title: "Отмена", style: .default) { (alert) in
        }
        let projectAlertAction2 = UIAlertAction(title: "Создать", style: .cancel) { (alert) in
            let newProjectItem = projectAlertController.textFields![0].text
            addProjectItem(nameProjectItem: newProjectItem!, shortnameProjectItem: newProjectItem!)
            self.tableView.reloadData()
        }
        
        
        projectAlertController.addAction(projectAlertAction1)
        projectAlertController.addAction(projectAlertAction2)
        present(projectAlertController, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return projectItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath)

        // Configure the cell...
        let currentItem = projectItems[indexPath.row]
        cell.textLabel?.text = currentItem["Name"] as? String
        cell.textLabel?.text = currentItem["ShortName"] as? String
        
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
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if changeProjectState(at: indexPath.row) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            removeProjectItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        moveProjectItem(fromIndex: fromIndexPath.row, toIndex: to.row)
        
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

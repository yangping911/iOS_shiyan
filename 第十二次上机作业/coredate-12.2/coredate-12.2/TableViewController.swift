//
//  TableViewController.swift
//  coredate-12.2
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 2016. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    
    let appdategate = UIApplication.shared.delegate as!AppDelegate
    let context=(UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
    
    var persons:[Person]?

    
    fileprivate func reloaddata() {
        let fetch:NSFetchRequest<Person>=Person.fetchRequest()
        persons=try?context.fetch(fetch)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reloaddata()
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
        return persons?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if let p=persons?[indexPath.row]{
            cell.textLabel?.text=p.name
        }
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="showdetail" {
            let secvc=segue.destination as! detailViewController
            
            if let indexpath=tableView.indexPath(for: sender as! UITableViewCell),let person=persons?[indexpath.row]{
                secvc.person=person
            }
            
            
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        tableView.reloadData()
    }

}

//
//  RandomParisTableViewController.swift
//  RandomPairs
//
//  Created by Kamil Wrobel on 10/5/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class RandomParisTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

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

    //MARK: - Actions
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        presentAddAlertWith(title: "Please Enter your full name", message: nil)
        
        
    }
    
    

}


extension RandomParisTableViewController {
    
    func presentAddAlertWith(title: String, message: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { (firstNameTextField) in
            firstNameTextField.placeholder = "Please enter you first name"
        }
        alert.addTextField { (lastNameTextField) in
            lastNameTextField.placeholder = "Please enter your last name"
        }
        let addButton = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let fName = alert.textFields?.first?.text,
                let lName = alert.textFields?[1].text else {return}
            
            
            //call save function
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(addButton)
        alert.addAction(cancelButton)
    
        
    }
    
    
    
}

//
//  RandomParisTableViewController.swift
//  RandomPairs
//
//  Created by Kamil Wrobel on 10/5/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class RandomParisTableViewController: UITableViewController {

    var sections: Int = 0
    var pseudoSection : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if RandomPairController.shared.randomPeople.count % 2 == 1 {
            sections = ((RandomPairController.shared.randomPeople.count + 1) / 2)
        } else {
            sections = RandomPairController.shared.randomPeople.count / 2
        }

        
        return sections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows: Int = 0
        
        if section < RandomPairController.shared.numberOfRowsAtSection.count {
            rows = RandomPairController.shared.numberOfRowsAtSection[section]
        }
        
     
        
        return rows
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = RandomPairController.shared.randomPeople[indexPath.row]
        cell.textLabel?.text = "\(person.firstName) \(person.lastName)"
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
        RandomPairController.shared.randomPeople.shuffle()
        tableView.reloadData()
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        presentAddAlertWith(title: "Please enter your name.", message: nil) { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        
    }
    
    

}


extension RandomParisTableViewController {
    
    func presentAddAlertWith(title: String, message: String?, completion: @escaping(Bool) -> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { (firstNameTextField) in
            firstNameTextField.placeholder = "first name"
        }
        alert.addTextField { (lastNameTextField) in
            lastNameTextField.placeholder = "last name"
        }
        let addButton = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let fName = alert.textFields?.first?.text,
                let lName = alert.textFields?[1].text else {return}
            let person  = RandomPerson(firstName: fName, lastName: lName)
            RandomPairController.shared.save(person: person)
           completion(true
            
            )
          
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(addButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    
    
}

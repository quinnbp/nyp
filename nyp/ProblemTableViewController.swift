//
//  ProblemTableViewController.swift
//  nyp
//
//  Created by Quinn Barker-Plummer on 7/8/19.
//  Copyright © 2019 Quinn Barker-Plummer. All rights reserved.
//

import UIKit

class ProblemTableViewController: UITableViewController {
    
    //MARK: Properties
    var problems = Array<Problem>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadProblems()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: Methods
    private func loadProblems () {
        let problem1 = Problem(year: 1943, difficulty: "h")
        let problem2 = Problem(year: 1547, difficulty: "m")
        let problem3 = Problem(year: 1846, difficulty: "e")
        
        problems += [problem1, problem2, problem3]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return problems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ProblemTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProblemTableViewCell else {
            fatalError("The dequeued cell is not an instance of ProblemTableViewCell.")
        }

        let problem = problems[indexPath.row]
        cell.yearLabel.text = problem.yearFull
        cell.percentLabel.text = problem.getPercent()
        cell.ratingLabel.text = problem.getRating()
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

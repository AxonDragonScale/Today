//
//  ViewController.swift
//  Today
//
//  Created by Ronak Harkhani on 17/04/21.
//

import UIKit

class ReminderListViewController: UITableViewController {
    static let showDetailSegueIdentifier = "ShowDetailSegue"
    
    private var reminderListDataSource: ReminderListDataSource?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.showDetailSegueIdentifier {
            let destination = segue.destination as? DetailViewController
            if let cell = sender as? UITableViewCell {
                if let indexPath = tableView.indexPath(for: cell) {
                    let reminder = Reminder.testData[indexPath.row]
                    destination?.configure(with: reminder)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminderListDataSource = ReminderListDataSource()
        tableView.dataSource = reminderListDataSource
    }
}


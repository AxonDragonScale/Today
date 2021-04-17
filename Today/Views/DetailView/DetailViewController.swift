//
//  DetailViewController.swift
//  Today
//
//  Created by Ronak Harkhani on 17/04/21.
//

import UIKit

class DetailViewController: UITableViewController {
    
    private var reminder: Reminder?
    private var dataSource: UITableViewDataSource?
    
    func configure(with reminder: Reminder) {
        self.reminder = reminder
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setEditing(false, animated: false)
        navigationItem.setRightBarButton(editButtonItem, animated: false)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
            dataSource = DetailEditDataSource()
        } else {
            guard let reminder = reminder else {
                fatalError("No Reminder found for detail view")
            }
            dataSource = DetailViewDataSource(reminder: reminder)
        }
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
}


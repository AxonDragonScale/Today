//
//  DetailEditDataSource.swift
//  Today
//
//  Created by Ronak Harkhani on 17/04/21.
//

import UIKit

class DetailEditDataSource: NSObject {
    enum ReminderSection: Int, CaseIterable {
        case title
        case dueDate
        case notes
        
        var displayText: String {
            switch self {
            case .title: return "Title"
            case .dueDate: return "Due Date"
            case .notes: return "Notes"
            }
        }
        
        func cellIdentifier(for row: Int) -> String {
            switch self {
            case .title: return "EditTitleCell"
            case .dueDate: return row == 0 ? "EditDateLabelCell" : "EditDateCell"
            case .notes: return "EditNotesCell"
            }
        }
    }
}

extension DetailEditDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return ReminderSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = ReminderSection(rawValue: section) else {
            fatalError("Section index out of range")
        }
        
        return section.displayText
    }
}

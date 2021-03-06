//
//  DetailViewDataSource.swift
//  Today
//
//  Created by Ronak Harkhani on 17/04/21.
//

import UIKit

class DetailViewDataSource: NSObject {
    
    private var reminder: Reminder
    init(reminder: Reminder) {
        self.reminder = reminder
        super.init()
    }
    
    enum ReminderRow: Int, CaseIterable {
        case title
        case date
        case time
        case notes
        
        static let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.timeStyle = .none
            formatter.dateStyle = .long
            return formatter
        }()
        
        static let timeFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            formatter.dateStyle = .none
            return formatter
        }()
        
        func displayText(for reminder: Reminder) -> String? {
            switch self {
            case .title: return reminder.title
            case .date: return Self.dateFormatter.string(from: reminder.dueDate)
            case .time: return Self.timeFormatter.string(from: reminder.dueDate)
            case .notes: return reminder.notes
            }
        }
        
        var cellImage: UIImage? {
            switch self {
            case .title: return nil
            case .date: return UIImage(systemName: "calendar.circle")
            case .time: return UIImage(systemName: "clock")
            case .notes: return UIImage(systemName: "square.and.pencil")
            }
        }
    }
}

extension DetailViewDataSource: UITableViewDataSource {
    static let detailCellIdentifier = "DetailCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderRow.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.detailCellIdentifier, for: indexPath)
        let row = ReminderRow(rawValue: indexPath.row)
        cell.textLabel?.text = row?.displayText(for: reminder)
        cell.imageView?.image = row?.cellImage
        return cell
    }
}

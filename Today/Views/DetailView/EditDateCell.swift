//
//  EditDateCell.swift
//  Today
//
//  Created by Ronak Harkhani on 17/04/21.
//

import UIKit

class EditDateCell: UITableViewCell {
    @IBOutlet var datePicker: UIDatePicker!
    
    func configure(date: Date) {
        datePicker.date = date
    }
}

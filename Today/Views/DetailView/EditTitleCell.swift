//
//  EditTitleCell.swift
//  Today
//
//  Created by Ronak Harkhani on 17/04/21.
//

import UIKit

class EditTitleCell: UITableViewCell {
    @IBOutlet var titleTextField: UITextField!
    
    func configure(title: String) {
        titleTextField.text = title
    }
}

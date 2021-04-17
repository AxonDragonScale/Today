//
//  ReminderListCell.swift
//  Today
//
//  Created by Ronak Harkhani on 17/04/21.
//

import UIKit

class ReminderListCell: UITableViewCell {
    typealias DoneButtonAction = () -> Void
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    private var doneButtonAction: DoneButtonAction?
    @IBAction func doneButtonTriggered(_ sender: UIButton) {
        doneButtonAction?()
    }
    
    func configure(title: String, dateText: String, isDone: Bool, doneButtonAction: @escaping DoneButtonAction) {
        titleLabel.text = title
        dateLabel.text = dateText
        let buttonImage = isDone ? UIImage(systemName: "largecircle.fill.circle") : UIImage(systemName: "circle")
        doneButton.setBackgroundImage(buttonImage, for: .normal)
        self.doneButtonAction = doneButtonAction
    }
}

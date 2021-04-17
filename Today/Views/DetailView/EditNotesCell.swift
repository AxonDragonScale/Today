//
//  EditNotesCell.swift
//  Today
//
//  Created by Ronak Harkhani on 17/04/21.
//

import UIKit

class EditNotesCell: UITableViewCell {
    @IBOutlet var notesTextView: UITextView!
    
    func configure(notes: String?) {
        notesTextView.text = notes
    }
}

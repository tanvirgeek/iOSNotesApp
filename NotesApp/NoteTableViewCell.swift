//
//  NoteTableViewCell.swift
//  NotesApp
//
//  Created by MD Tanvir Alam on 8/10/20.
//  Copyright © 2020 MD Tanvir Alam. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var noteLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

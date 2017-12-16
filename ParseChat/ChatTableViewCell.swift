//
//  ChatTableViewCell.swift
//  ParseChat
//
//  Created by Allison Reiss on 12/15/17.
//  Copyright © 2017 Allison Reiss. All rights reserved.
//

import UIKit
import Parse

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

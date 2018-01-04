//
//  PharmacyTableViewCell.swift
//  Homework-6 for CS392 IOS Development Course @ Ozyegin University
//
//  Created by Furkan Kınlı on 03/12/17.
//  Copyright © 2017 Furkan Kınlı. All rights reserved.
//

import UIKit

class PharmacyTableViewCell: UITableViewCell {

    @IBOutlet weak var pharmacyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

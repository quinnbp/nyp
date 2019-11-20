//
//  ProblemTableViewCell.swift
//  nyp
//
//  Created by Quinn Barker-Plummer on 7/8/19.
//  Copyright © 2019 Quinn Barker-Plummer. All rights reserved.
//

import UIKit

class ProblemTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

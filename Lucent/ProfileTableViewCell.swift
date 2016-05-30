//
//  ProfileTableViewCell.swift
//  Lucent
//
//  Created by Marc on 29/05/2016.
//  Copyright © 2016 Marc Obaldo. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    // MARK : Properties    
    @IBOutlet weak var quickSettingName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layoutMargins = UIEdgeInsetsZero
        self.separatorInset = UIEdgeInsetsZero
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

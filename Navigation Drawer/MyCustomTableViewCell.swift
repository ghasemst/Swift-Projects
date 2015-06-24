//
//  MyCustomTableViewCell.swift
//  Navigation Drawer
//
//  Created by Ghasem Tabatabaei on 24/06/15.
//  Copyright © 2015 Ghasem Tabatabaei. All rights reserved.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var menuItemLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

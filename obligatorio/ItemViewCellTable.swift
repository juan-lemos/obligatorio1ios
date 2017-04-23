//
//  ItemViewCellTableViewCell.swift
//  obligatorio
//
//  Created by JuanPablo on 4/23/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class ItemViewCellTable: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var number: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

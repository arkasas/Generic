//
//  SimplePlistTableViewCell.swift
//  GenericDemo
//
//  Created by Arkadiusz Pituła on 16.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit
import Generic

class SimplePlistTableViewCell: BaseTableViewCell<SimplePlistModel> {

    override var model: SimplePlistModel? {
        didSet {
            textLabel?.text = model?.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

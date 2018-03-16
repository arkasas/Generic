//
//  StandardTableViewCell.swift
//  GenericDemo
//
//  Created by Arkadiusz Pituła on 16.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit
import Generic

class StandardTableViewCell: BaseTableViewCell<StandardStringModel> {

    override var model: StandardStringModel? {
        didSet {
            textLabel?.text = model?.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

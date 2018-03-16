//
//  ColCollectionViewCell.swift
//  GenericDemo
//
//  Created by Arkadiusz Pituła on 16.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit
import Generic

class ColCollectionViewCell: BaseCollectionViewCell<CollectionModel> {

    @IBOutlet weak var imageView: UIImageView!

    override var model: CollectionModel? {
        didSet {
            imageView.image = model?.image
        }
    }
}

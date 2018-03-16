//
//  CollectionModel.swift
//  GenericDemo
//
//  Created by Arkadiusz Pituła on 16.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation
import Generic

class CollectionModel: Model {
    var reuseIdentifier: String = "collectionCell"

    var image: UIImage!

    init(image: UIImage) {
        self.image = image
    }
}

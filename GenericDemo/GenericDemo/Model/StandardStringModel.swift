//
//  StandardStringModel.swift
//  GenericDemo
//
//  Created by Arkadiusz Pituła on 16.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation
import Generic

class StandardStringModel: Model {
    var reuseIdentifier: String = "DefaultCell"

    var name: String!
    init(name: String) {
        self.name = name
    }
}

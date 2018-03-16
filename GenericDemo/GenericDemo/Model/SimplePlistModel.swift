//
//  SimplePlistModel.swift
//  GenericDemo
//
//  Created by Arkadiusz Pituła on 16.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation
import Generic

class SimplePlistModel: DictionaryDecoder, Model {
    var reuseIdentifier: String = "DefaultCell"
    var name: String!

    required init(dictinary: NSDictionary) {
        name = dictinary.object(forKey: "name") as! String
    }
}

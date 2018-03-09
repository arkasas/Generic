//
//  Collection+SefeIndex.swift
//  Generic
//
//  Created by Arkadiusz Pituła on 09.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation
public extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

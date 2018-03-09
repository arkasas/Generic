//
//  BaseCollectionViewCell.swift
//  Generic
//
//  Created by Arkadiusz Pituła on 09.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit

open class BaseCollectionViewCell<T>: UICollectionViewCell, Cell {
    public typealias ModelType = T
    open var model: T? = nil
}

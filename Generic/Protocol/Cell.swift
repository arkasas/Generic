//
//  Cell.swift
//  Generic
//
//  Created by Arkadiusz Pituła on 09.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

public protocol Cell {
    associatedtype ModelType
    var model: ModelType? { get }
}

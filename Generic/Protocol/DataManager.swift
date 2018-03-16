//
//  DataManager.swift
//  Generic
//
//  Created by Arkadiusz Pituła on 09.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation

public protocol DataManager {

    associatedtype DataType

    func numberOfItems(inSection section: Int) -> Int?
    func numberOfSection() -> Int

    func item(atIndexPath indexPath: IndexPath) -> DataType?
    func append(newItem item: DataType, toSection section: Int)
    func append(newItems items: [DataType], toSection section: Int)

    func append(newSection section: Section<DataType>)
    func append(newSections sections: [Section<DataType>])

    func section(forSectionIndex index: Int) -> Section<DataType>?
}

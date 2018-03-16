//
//  StandardDataManager.swift
//  Generic
//
//  Created by Arkadiusz Pituła on 09.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import Foundation

open class StandardDataManager<T>: DataManager {

    public typealias DataType = T

    private var sections: [Section<T>]

    public init(sections: [Section<T>] = []) {
        self.sections = sections
    }

    public func numberOfItems(inSection section: Int) -> Int? {
        return sections[safe: section]?.rows.count
    }

    public func numberOfSection() -> Int {
        return sections.count
    }

    public func item(atIndexPath indexPath: IndexPath) -> T? {
        return sections[safe: indexPath.section]?.rows[safe: indexPath.row]
    }

    public func append(newItem item: T, toSection section: Int = 0) {
        sections[safe: section]?.rows.append(item)
    }

    public func append(newItems items: [T], toSection section: Int = 0) {
        sections[safe: section]?.rows.append(contentsOf: items)
    }

    public func append(newSection section: Section<T>) {
        sections.append(section)
    }

    public func append(newSections sections: [Section<T>]) {
        self.sections.append(contentsOf: sections)
    }

    public func section(forSectionIndex index: Int) -> Section<T>? {
        return sections[safe: index]
    }

}

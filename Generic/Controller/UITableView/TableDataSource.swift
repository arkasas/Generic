//
//  TableDataSource.swift
//  Generic
//
//  Created by Arkadiusz Pituła on 09.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit

open class TableDataSource<T: DataManager>: NSObject, UITableViewDataSource where T.DataType: Model {

    public let dataManager: T

    public init(dataManager: T) {
        self.dataManager = dataManager
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return dataManager.numberOfSection()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.numberOfItems(inSection: section) ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return populate(tableView, indexPath: indexPath)
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataManager.section(forSectionIndex: section)?.name
    }

    private func populate(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let model = dataManager.item(atIndexPath: indexPath) else {
            return UITableViewCell()
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: model.reuseIdentifier, for: indexPath) as? BaseTableViewCell<T.DataType> {
            cell.model = model
            return cell

        } else {
            return UITableViewCell()
        }
    }
}

//
//  CollectionDataSource.swift
//  Generic
//
//  Created by Arkadiusz Pituła on 09.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit

open class CollectionDataSource<T: DataManager>: NSObject, UICollectionViewDataSource where T.DataType: Model {

    public let dataManager: T

    public init(dataManager: T) {
        self.dataManager = dataManager
    }

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataManager.numberOfSection()
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataManager.numberOfItems(inSection: section) ?? 0
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return populate(collectionView, indexPath: indexPath)
    }

    private func populate(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let model = dataManager.item(atIndexPath: indexPath) else {
            return UICollectionViewCell()
        }
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.reuseIdentifier, for: indexPath) as? BaseCollectionViewCell<T.DataType> {
            cell.model = model
            return cell

        } else {
            return UICollectionViewCell()
        }
    }
}

//
//  CollectionViewController.swift
//  GenericDemo
//
//  Created by Arkadiusz Pituła on 16.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit
import Generic

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    lazy var dataSource: CollectionDataSource<StandardDataManager<CollectionModel>> = {
        let section = Section<CollectionModel>(rows: [
            CollectionModel(image: #imageLiteral(resourceName: "Charmander")),
            CollectionModel(image: #imageLiteral(resourceName: "Squirtle")),
            CollectionModel(image: #imageLiteral(resourceName: "torchic")),
            CollectionModel(image: #imageLiteral(resourceName: "bulb"))
        ])
        let manager = StandardDataManager(sections: [section])
        return CollectionDataSource(dataManager: manager)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = dataSource
        collectionView.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.width)
    }
}

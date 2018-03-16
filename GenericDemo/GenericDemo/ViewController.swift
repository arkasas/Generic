//
//  ViewController.swift
//  GenericDemo
//
//  Created by Arkadiusz Pituła on 16.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit
import Generic

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var rows = [
        "Default plist file",
        "Plist file with section",
        "UICollectionView"
    ]

    lazy var dataSource: TableDataSource<StandardDataManager<StandardStringModel>> = {
        let section = Section<StandardStringModel>(rows: [
            StandardStringModel(name: rows[0]),
            StandardStringModel(name: rows[1]),
            StandardStringModel(name: rows[2])
            ])

        let manager = StandardDataManager<StandardStringModel>(sections: [section])
        return TableDataSource(dataManager: manager)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataSource
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DefaultPlist")
            show(vc, sender: self)
        } else if indexPath.row == 1 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SectionPlist")
            show(vc, sender: self)
        } else if indexPath.row == 2 {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CollectionView")
            show(vc, sender: self)
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
}


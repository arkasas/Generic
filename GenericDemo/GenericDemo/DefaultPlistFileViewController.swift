//
//  DefaultPlistFileViewController.swift
//  GenericDemo
//
//  Created by Arkadiusz Pituła on 16.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit
import Generic

class DefaultPlistFileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    lazy var dataSource: TableDataSource<PlistDataManager<SimplePlistModel>> = {
        let manager = PlistDataManager<SimplePlistModel>(fileName: "Default", dictKey: "Menu")
        return TableDataSource(dataManager: manager)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}



//
//  SectionPlistViewController.swift
//  GenericDemo
//
//  Created by Arkadiusz Pituła on 16.03.2018.
//  Copyright © 2018 Arkadiusz Pituła. All rights reserved.
//

import UIKit
import Generic

class SectionPlistViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    lazy var dataSource: TableDataSource<PlistSectionDataManager<SectionPlistModel>> = {
        let manager = PlistSectionDataManager<SectionPlistModel>(name: "Section", key: "Menu")
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

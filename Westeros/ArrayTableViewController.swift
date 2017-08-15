//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 7/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {

    let dataSource: ArrayDataSource<Element>
    let delegate: ArrayDelegate<Element>?

    
    init(dataSource: ArrayDataSource<Element>, title: String, style: UITableViewStyle, delegate: ArrayDelegate<Element>){
        
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(style: style)
        self.title = title
        
        tableView.dataSource = self.dataSource
        tableView.delegate = self.delegate
        self.delegate?.controller = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

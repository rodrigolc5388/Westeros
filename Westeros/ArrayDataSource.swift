//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 3/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import UIKit

final class ArrayDataSource<Element>: NSObject, UITableViewDataSource{
    
    typealias Elements = [Element]
    typealias CellMaker = (Element, UITableView)->UITableViewCell
    
    private let _model: Elements
    private let _cellMaker: CellMaker
    
    init(model: Elements, cellMaker: @escaping CellMaker){
        _model = model
        _cellMaker = cellMaker
        super.init()
    }
    
    // Si este método no se implementa, por defecto el valor será 1
    // por lo que este método podría eliminarse
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let elt = _model[indexPath.row]
        return _cellMaker(elt, tableView)
    }
}

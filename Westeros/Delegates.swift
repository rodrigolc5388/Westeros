//
//  Delegates.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 7/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import UIKit


final class Delegates{
    
    static func housesDelegate(model: [House]) -> ArrayDelegate<House>{
        
        return ArrayDelegate(model: model, selectRow: { (house: House, tableView: UITableView, controller: UITableViewController?) -> Void in
            
            let houseVC = HouseViewController(model: house)
            controller?.navigationController?.pushViewController(houseVC, animated: true)
        })
    }
}
























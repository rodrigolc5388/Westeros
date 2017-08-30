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
    
    static func seasonsDelegate(model: [Season]) -> ArrayDelegate<Season>{
        
        return ArrayDelegate(model: model, selectRow: { (season: Season, tableView: UITableView, controller: UITableViewController?) -> Void in
            
            let seasonVC = SeasonViewController(model: season)
            controller?.navigationController?.pushViewController(seasonVC, animated: true)
        })
    }
    
    static func episodesDelegate(model: [Episode]) -> ArrayDelegate<Episode>{
        
        return ArrayDelegate(model: model, selectRow: { (episode: Episode, tableView: UITableView, controller: UITableViewController?) -> Void in
            
            let episodeVC = EpisodeViewController(model: episode)
            controller?.navigationController?.pushViewController(episodeVC, animated: true)
        })
    }

    
}
























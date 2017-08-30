//
//  DataSource.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 7/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import UIKit

final class DataSources{
    
    static func houseDataSource(model: [House]) -> ArrayDataSource<House>{
        
        return ArrayDataSource(model: model, cellMaker: { (house: House, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "House"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            return cell!
        })
    }
    
    static func personDataSource(model: [Person]) -> ArrayDataSource<Person>{
        
        return ArrayDataSource(model: model, cellMaker: { (person: Person, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "Person"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = person.fullName
            return cell!
        })
    }
    
    static func seasonDataSource(model: [Season]) -> ArrayDataSource<Season>{
        
        return ArrayDataSource(model: model, cellMaker: { (season: Season, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "Season"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = season.seasonName
            cell?.detailTextLabel?.text = "\(season.count) episodes"
            return cell!
        })
    }
    
    static func episodesDataSource(model: [Episode]) -> ArrayDataSource<Episode>{
        
        return ArrayDataSource(model: model, cellMaker: { (episode: Episode, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "Episode"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = episode.title
            cell?.detailTextLabel?.text = "Emission Date: \(episode.emissionDate)"
            return cell!
        })
    }

}

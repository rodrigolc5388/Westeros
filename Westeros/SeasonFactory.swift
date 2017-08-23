//
//  SeasonFactory.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 22/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import Foundation

protocol SeasonFactory{
    
    typealias Filter = (Season) -> Bool
    
    var seasons: [Season] {get}
    func season(named: String) -> Season?
    func seasons(filteredBy: Filter) -> [Season]
}

extension LocalFactory: SeasonFactory{
    
    
    func seasons(filteredBy: (Season) -> Bool) -> [Season] {
        let filtered = Repository.local.seasons.filter(filteredBy)
        return filtered
    }
    var seasons: [Season]{
        get{
            
            let season1 = Season(name: "Season 1", releaseDate: Date.dateFromString(date: "2011/04/17")!, image: #imageLiteral(resourceName: "season1.jpg"))
            let season2 = Season(name: "Season 2", releaseDate: Date.dateFromString(date: "2012/04/01")!, image: #imageLiteral(resourceName: "season2.jpg"))
            let season3 = Season(name: "Season 3", releaseDate: Date.dateFromString(date: "2013/03/31")!, image: #imageLiteral(resourceName: "season3.jpg"))
            let season4 = Season(name: "Season 4", releaseDate: Date.dateFromString(date: "2014/04/06")!, image: #imageLiteral(resourceName: "season4.jpg"))
            let season5 = Season(name: "Season 5", releaseDate: Date.dateFromString(date: "2015/04/12")!, image: #imageLiteral(resourceName: "season5.jpg"))
            let season6 = Season(name: "Season 6", releaseDate: Date.dateFromString(date: "2016/04/24")!, image: #imageLiteral(resourceName: "season6.jpg"))
            let season7 = Season(name: "Season 7", releaseDate: Date.dateFromString(date: "2017/07/16")!, image: #imageLiteral(resourceName: "season7.jpg"))
            
            season1.add(episodes:
            Episode(title: "Winter is coming", emissionDate: Date.dateFromString(date: "2011/04/17")!, season: season1),
            Episode(title: "The Kingsroad", emissionDate: Date.dateFromString(date: "2011/04/24")!, season: season1))
        
            season2.add(episodes:
            Episode(title: "The North Remembers", emissionDate: Date.dateFromString(date: "2012/04/01")!, season: season2),
            Episode(title: "The Night Lands", emissionDate: Date.dateFromString(date: "2012/04/08")!, season: season2))
            
            season3.add(episodes:
            Episode(title: "Valar Dohaeris", emissionDate: Date.dateFromString(date: "2013/03/31")!, season: season3),
            Episode(title: "Dark Wings, Dark Words", emissionDate: Date.dateFromString(date: "2013/04/07")!, season: season3))
            
            season4.add(episodes:
            Episode(title: "Two Swords", emissionDate: Date.dateFromString(date: "2014/04/06")!, season: season4),
            Episode(title: "The Lion and the Rose", emissionDate: Date.dateFromString(date: "2014/04/13")!, season: season4))
            
            season5.add(episodes:
            Episode(title: "The Wars to Come", emissionDate: Date.dateFromString(date: "2015/04/12")!, season: season5),
            Episode(title: "The House of Black and White", emissionDate: Date.dateFromString(date: "2015/04/19")!, season: season5))
            
            season6.add(episodes:
            Episode(title: "The Red Woman", emissionDate: Date.dateFromString(date: "2016/04/24")!, season: season6),
            Episode(title: "Home", emissionDate: Date.dateFromString(date: "2016/05/01")!, season: season6))
            
            season7.add(episodes:
            Episode(title: "Dragonstone", emissionDate: Date.dateFromString(date: "2017/07/16")!, season: season7),
            Episode(title: "Stormborn", emissionDate: Date.dateFromString(date: "2017/07/23")!, season: season7))
            
            
            
            
            return [season1, season2, season3, season4, season5, season6, season7].sorted()
        }
    }
    
    func season(named: String) -> Season? {
        let season = seasons.filter{$0.seasonName.uppercased() == named.uppercased()}.first
        return season
    }

}

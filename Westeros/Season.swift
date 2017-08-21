//
//  Season.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 15/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import UIKit

//MARK: - Classes

typealias Episodes = Set<Episode>

final class Season{
    
    let seasonName  : String
    let releaseDate : Date
    var _episodes: Episodes
    
    init(name: String, releaseDate: Date){
        
        (self.seasonName, self.releaseDate) = (name, releaseDate)
        _episodes = Episodes()
    }
}

extension Season{
    var count: Int{
        return _episodes.count
    }
    
    func add(episode: Episode){
        guard episode.season?.seasonName == seasonName else {
            return
        }
        _episodes.insert(episode)
    }
    
    //Variadic version
    func add(episodes: Episode...){
        for episode in episodes{
            add(episode: episode)
        }
    }
    
    //Sorted [Episode]
    func sortedEpisodes() -> [Episode]{
        return _episodes.sorted()
    }
}


//MARK: - Protocols

//MARK: - Proxy
extension Season{
    var proxyFor: String{
        return seasonName.uppercased()
    }
}

//MARK: - CustomStringConvertible
extension Season: CustomStringConvertible{
    
    var description: String {
        
        return "(Name: \(seasonName), Release Date: \(releaseDate))"
    }
}

//MARK: - Equatable
extension Season: Equatable{
    
    static func ==(lhs: Season, rhs: Season) -> Bool{
        return lhs.description.uppercased() == rhs.description.uppercased()
    }
}

//MARK: - Hashable
extension Season: Hashable{
    
    var hashValue: Int {
        return proxyFor.hashValue
    }
}

//MARK: - Comparable
extension Season: Comparable{
    static func <(lhs: Season, rhs: Season) -> Bool{
        return lhs.proxyFor < rhs.proxyFor
    }
    
    static func <=(lhs: Season, rhs: Season) -> Bool{
        return lhs.proxyFor <= rhs.proxyFor
    }
}

//
//  Episode.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 15/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import UIKit

//MARK: - Classes
final class Episode{
    
    let title: String
    let emissionDate: Date
    weak var season: Season?
    
    init(title: String, emissionDate: Date, season: Season){
        (self.title, self.emissionDate, self.season) = (title, emissionDate, season)
    }
}



//MARK: - Protocols

//MARK: - Proxy
extension Episode{
    var proxyFor: String{
        return title.uppercased()
    }
}

//MARK: - CustomStringConvertible
extension Episode: CustomStringConvertible{
    
    var description: String {
        
        return "(Name: \(title), Release Date: \(emissionDate))"
    }
}

//MARK: - Equatable
extension Episode: Equatable{
    
    static func ==(lhs: Episode, rhs: Episode) -> Bool{
        return lhs.description.uppercased() == rhs.description.uppercased()
    }
}

//MARK: - Hashable
extension Episode: Hashable{
    
    var hashValue: Int {
        return proxyFor.hashValue
    }
}

//MARK: - Comparable
extension Episode: Comparable{
    static func <(lhs: Episode, rhs: Episode) -> Bool{
        return lhs.proxyFor < rhs.proxyFor
    }
    
    static func <=(lhs: Episode, rhs: Episode) -> Bool{
        return lhs.proxyFor <= rhs.proxyFor
    }
}


//
//  Season.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 15/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import UIKit

//MARK: - Classes
final class Seasson{
    
    let seassonName  : String
    let episodes    : Int
    let releaseDate : Date
    
    init(name: String, episodes: Int, releaseDate: Date){
        
        (self.seassonName, self.episodes, self.releaseDate) = (name, episodes, releaseDate)
    }
}


//MARK: - Protocols

//MARK: - Proxy
extension Seasson{
    var proxyFor: String{
        return seassonName.uppercased()
    }
}

//MARK: - CustomStringConvertible
extension Seasson: CustomStringConvertible{
    
    var description: String {
        
        return "(Name: \(seassonName), Episodes: \(episodes), Release Date: \(releaseDate))"
    }
}

//MARK: - Equatable
extension Seasson: Equatable{
    
    static func ==(lhs: Seasson, rhs: Seasson) -> Bool{
        return lhs.description.uppercased() == rhs.description.uppercased()
    }
}

//MARK: - Hashable
extension Seasson: Hashable{
    
    var hashValue: Int {
        return proxyFor.hashValue
    }
}

//MARK: - Comparable
extension Seasson: Comparable{
    static func <(lhs: Seasson, rhs: Seasson) -> Bool{
        return lhs.proxyFor < rhs.proxyFor
    }
    
    static func <=(lhs: Seasson, rhs: Seasson) -> Bool{
        return lhs.proxyFor <= rhs.proxyFor
    }
}

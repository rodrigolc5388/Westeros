//
//  House.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 15/7/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import UIKit


//MARK: - Classes
typealias Words = String
typealias Members = Set<Person>

final class House{
    
    let name    : String
    let sigil   : Sigil
    let words   : Words
    let wikiURL : URL
    /*private*/ var _members: Members
    
    init(name: String, sigil: Sigil, words: Words, url: URL){
        
        (self.name, self.sigil, self.words, self.wikiURL) = (name, sigil, words, url)
        _members = Members()
    }
}

final class Sigil{
    
    let description: String
    let image      : UIImage
    
    init(image: UIImage, description: String){
        (self.image, self.description) = (image, description)
    }
}

extension House{
    var count : Int{
        return _members.count
    }
    
    func add(person: Person){
        guard person.house.name == name else {
            return
        }
        _members.insert(person)
    }
    
    // Variadic version
    func add(persons: Person...){
        for person in persons{
            add(person: person)
        }
    }
    
    // Sorted [Person]
    func sortedMembers() -> [Person] {
        return _members.sorted()
    }
}

// Proxy for Equality
extension House{
    var proxyForEquality: String{
        return "\(name) \(words) \(count)"
    }

// Proxy for Comparison
    var proxyForComparison: String{
        return name.uppercased()
    }
}

// MARK: - Hashable
extension House: Hashable{
    var hashValue: Int {
            return proxyForEquality.hashValue
    }
}

// MARK: - Equatable
extension House: Equatable{
    static func ==(lhs: House, rhs: House) -> Bool{
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MARK: - Comparable
extension House: Comparable{
    static func <(lhs: House, rhs: House) -> Bool{
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    static func <=(lhs: House, rhs: House) -> Bool{
        return lhs.proxyForComparison <= rhs.proxyForComparison
    }
    
    static func >=(lhs: House, rhs: House) -> Bool{
        return lhs.proxyForComparison >= rhs.proxyForComparison
    }
    
    static func >(lhs: House, rhs: House) -> Bool{
        return lhs.proxyForComparison > rhs.proxyForComparison
    }
}















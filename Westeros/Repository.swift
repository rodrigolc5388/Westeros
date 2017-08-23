//
//  Repository.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 20/7/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import Foundation

final class Repository{
    
    static let local = LocalFactory()
}

protocol HouseFactory{
    
    typealias Filter = (House) -> Bool
    
    var houses: [House] {get}
    func house(named: String) -> House?
    func houses(filteredBy: Filter) -> [House]
}


final class LocalFactory: HouseFactory{
    
    func houses(filteredBy: (House) -> Bool) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
    
    var houses: [House]{
        get{
            // Aquí es donde te creas tus casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryen.jpg"), description: "Three dragons")
            
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
            let targaryenURL = URL(string:"https://awoiaf.westeros.org/index.php/House_Targaryen")!
            
            
            let stark = House(name: "Stark",
                              sigil: starkSigil,
                              words: "Winter is coming!",
                              url: starkURL )
            let lannister = House(name: "Lannister",
                                  sigil: lannisterSigil,
                                  words: "Hear me roar!",
                                  url: lannisterURL)
            let targaryen = House(name: "Targaryen",
                                  sigil: targaryenSigil,
                                  words: "Fire & blood",
                                  url: targaryenURL)
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            let jamie = Person(name: "Jamie", alias: "Kingslayer", house: lannister)
            
            let dani = Person(name: "Daenerys", alias: "Mother of dragons", house: targaryen)
            
            // Añadir los personajes a las casas
            stark.add(persons: robb, arya)
            lannister.add(persons: jamie, cersei, tyrion)
            targaryen.add(person: dani)
            
            return [stark, lannister, targaryen].sorted()
        }
    }

    func house(named: String) -> House?{
        
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
    }
    
}






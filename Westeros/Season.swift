//
//  Season.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 15/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import UIKit

//MARK: - Classes
final class Season{
    
    let name        : String
    let episodes    : Int
    let releaseDate : Date
    
    init(name: String, episodes: Int, releaseDate: Date){
        (self.name, self.episodes, self.releaseDate) = (name, episodes, releaseDate)
        
    }
}

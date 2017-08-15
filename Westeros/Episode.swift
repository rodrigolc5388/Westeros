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
    weak var seasson: Season?
    
    init(title: String, emissionDate: Date, seasson: Season){
        (self.title, self.emissionDate, self.seasson) = (title, emissionDate, seasson)
    }
    
    
}

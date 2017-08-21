//
//  DateExtensions.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 21/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import Foundation

extension Date{
    
    static func dateFromString(date: String) -> Date?{
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy/MM/dd"
        
        return formatter.date(from: date)
        
    }
}

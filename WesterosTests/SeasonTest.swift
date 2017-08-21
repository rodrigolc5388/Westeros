//
//  SeassonTest.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 18/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTest: XCTestCase {
    
    var season1: Season!
    var season2: Season!
    
    
    
    override func setUp() {
        super.setUp()
        
        season1 = Season(name: "Season 1", releaseDate: Date.dateFromString(date: "2011/04/17")!)
        season2 = Season(name: "Season 2", releaseDate: Date.dateFromString(date: "2012/04/01")!)
    }
    
    func testSeassonDescription(){
        XCTAssertNotNil(season1)
    }
    
    func testSeasonEquatable(){
        XCTAssertNotEqual(season1, season2)
    }
    
    func testSeasonHashable(){
        XCTAssertNotNil(season1.hashValue)
    }
    
    func testSeasonComparable(){
        XCTAssertLessThan(season1, season2)
    }
    
    
}

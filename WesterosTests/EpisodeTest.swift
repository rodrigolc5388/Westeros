//
//  EpisodeTest.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 21/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTest: XCTestCase {
    
    var season1: Season!
    var season2: Season!
    
    var episode1: Episode!
    var episode11: Episode!
    
    override func setUp() {
        super.setUp()
        
        season1 = Season(name: "Season 1", releaseDate: Date.dateFromString(date: "2011/04/17")!)
        season2 = Season(name: "Season 2", releaseDate: Date.dateFromString(date: "2012/04/01")!)
        
        episode1 = Episode(title: "Winter is coming", emissionDate: Date.dateFromString(date: "2011/04/17")!, season: season1)
        episode11 = Episode(title: "The North Remembers", emissionDate: Date.dateFromString(date: "2012/04/01")!, season: season2)
    }
    
    func testEpisodeDescription(){
        XCTAssertNotNil(episode1)
    }
    
    func testEpisodeEquatable(){
        XCTAssertNotEqual(episode1, episode11)
    }
    
    func testEpisodeHashable(){
        XCTAssertNotNil(episode1.hashValue)
    }
    
    func testEpisodeComparable(){
        XCTAssertLessThan(episode11, episode1)
    }
    
    
}

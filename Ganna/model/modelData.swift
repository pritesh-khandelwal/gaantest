//
//  modelData.swift
//  Ganna
//
//  Created by Pritesh Khandelwal on 27/07/19.
//  Copyright © 2019 Pritesh Khandelwal. All rights reserved.
//

import Foundation

// MARK: - GaanaModel
class GaanaModel: Codable {
    var status: Int = 0
    var sections: [Section] =   [Section]()
    
//    init(status: Int, sections: [Section]) {
//        self.status = status
//        self.sections = sections
   // }
}

// MARK: - Section
class Section: Codable {
    var name: String = ""
    var tracks: [Track] = [Track]()
    
//    init(name: String, tracks: [Track]) {
//        self.name = name
//        self.tracks = tracks
//    }
}

// MARK: - Track
class Track: Codable {
    var name: String = ""
    var itemID: String = ""
    var atw: String = ""
    
//    init(name: String, itemID: String, atw: String) {
//        self.name = name
//        self.itemID = itemID
//        self.atw = atw
//    }
}

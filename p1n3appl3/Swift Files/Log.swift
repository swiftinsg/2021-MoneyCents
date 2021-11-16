//
//  Log.swift
//  p1n3appl3
//
//  Created by Conqueriings on 16/11/21.
//

import Foundation

// New log

struct Log: Equatable, Codable {
    var ID = UUID()
    var Name: String
    var dateSelector = Date()
    var Amount: Double
    var Category: String
    var Details: String
}

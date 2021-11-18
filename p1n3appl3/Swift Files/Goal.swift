//
//  Goal.swift
//  p1n3appl3
//
//  Created by sap on 11/17/21.
//

import Foundation

struct Goal: Identifiable, Equatable, Codable {
    var id = UUID()
    var Name: String
    var Amount: String
}

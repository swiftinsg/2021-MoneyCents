//
//  Goal.swift
//  MoneyCents
//
//  Created by sap on 11/17/21.
//

import Foundation

struct Goal: Identifiable, Equatable, Codable {
    var id = UUID()
    var name: String
    var amount: String
}

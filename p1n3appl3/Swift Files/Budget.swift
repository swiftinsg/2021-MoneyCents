//
//  Budget.swift
//  p1n3appl3
//
//  Created by Conqueriings on 19/11/21.
//

import Foundation
import SwiftUI

struct Budget: Identifiable, Equatable, Codable {
    var id = UUID()
    var nameOfItem: String
    var amount: String
    
}

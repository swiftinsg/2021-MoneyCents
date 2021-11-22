//
//  LogTypes.swift
//  p1n3appl3
//
//  Created by Conqueriings on 18/11/21.
//

import Foundation

enum LogTypes: String, Codable {
    case food = "Food"
    case others = "Others"
    case entertainment = "Entertainment"
    case transport = "Transport"
    
    
    // function
    func getSymbolName() -> String {
        switch self {
            
        case.food:
            return "fork.knife"
        case .others:
            return "bag.fill"
        case .entertainment:
            return "theatremask.fill"
        case .transport:
            return "bus.fill"
        }
    }
}

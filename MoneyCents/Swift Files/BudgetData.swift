//
//  BudgetData.swift
//  MoneyCents
//
//  Created by Conqueriings on 23/11/21.
//

import Foundation
import SwiftUI

class BudgetData: ObservableObject {
    @Published var budgets: [Budget] = []

    let sampleBudgets = [
        Budget(name: "Default", amount: 20.00),
        Budget(name: "Food", amount: 30.00),
        Budget(name: "Transport", amount: 20.00),
        Budget(name: "Entertainment", amount: 30.00)
    ]
    
    func getArchiveURL() -> URL {
        let plistName = "budgets.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedBudgets = try? propertyListEncoder.encode(budgets)
        try? encodedBudgets?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalBudgets: [Budget]!
        
        if let retrievedBudgetData = try? Data(contentsOf: archiveURL),
            let decodedBudgets = try? propertyListDecoder.decode([Budget].self, from: retrievedBudgetData) {
            finalBudgets = decodedBudgets
        } else {
            finalBudgets = sampleBudgets
        }
        
        budgets = finalBudgets
    }
}

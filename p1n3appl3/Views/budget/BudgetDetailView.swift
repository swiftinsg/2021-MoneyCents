//
//  BudgetDetailView.swift
//  p1n3appl3
//
//  Created by SAP on 20/11/21.
//

import SwiftUI

struct BudgetDetailView: View {
    @Binding var budget: Budget
    @Binding var logs: [Log]
    
    var body: some View {
        List {
            Section(header: Text("Recent Transcations")) {
                
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(budget.name)
    }
}

struct BudgetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetDetailView(budget: .constant(Budget(name: "", amount: 0.00)), logs: .constant([]))
    }
}

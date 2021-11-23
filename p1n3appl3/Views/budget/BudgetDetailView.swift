//
//  BudgetDetailView.swift
//  p1n3appl3
//
//  Created by SAP on 20/11/21.
//

import SwiftUI

struct BudgetDetailView: View {
    @Binding var budget: Budget
    @Binding var budgets: [Budget]
    @Binding var logs: [Log]
    
    var body: some View {
        List {
            Section(header: Text("Recent Transcations")) {
                let filteredlogs = logs.filter({$0.category == budget.name})
                let sortedLogs = filteredlogs.sorted(by: { $0.dateSelector.compare($1.dateSelector) == .orderedDescending })
                ForEach(sortedLogs) { log in
                    let logIndex = logs.firstIndex(of: log)! // get the index of the current log from logs
                    
                    NavigationLink(destination: LogDetailView(log: $logs[logIndex], budgets: $budgets)) {
                        Image(systemName: log.icon)
                            .font(Font.system(size: 16))
                            .foregroundColor(Color(UIColor(named: "AccentColor") ?? .blue))
                            .frame(minWidth: 30)
                        
                        VStack(alignment: .leading) {
                            Text(log.name)
                                .font(.headline)
                            Text(log.dateSelector.getFormattedDate(format: "d MMM yyyy"))
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        Text("$\(String(format: "%.2f", log.amount))")
                            .foregroundColor(.red)
                    }
                }
                .onDelete { offsets in
                    for i in offsets {
                        if let found = logs.firstIndex(where: { $0 == sortedLogs[i] }) {
                            logs.remove(at: found)
                        }
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(budget.name)
    }
}

struct BudgetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetDetailView(budget: .constant(Budget(name: "", amount: 0.00)),
                         budgets: .constant([]),
                         logs: .constant([])
        )
    }
}

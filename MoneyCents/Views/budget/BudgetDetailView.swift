//
//  BudgetDetailView.swift
//  MoneyCents
//
//  Created by SAP on 20/11/21.
//

import SwiftUI

struct BudgetDetailView: View {
    @Binding var budget: Budget
    @Binding var budgets: [Budget]
    @Binding var logs: [Log]
    @State var expenses = 0.00
    @State var expensesPresent = 0
    
    var body: some View {
        List {
            Section {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Total")
                    }
                    Spacer()
                    Text("$\(expenses, specifier: "%.2f")")
                        .foregroundColor(.red)
                }
            }
            
            Section(header: Text("Recent Transactions")) {
                let filteredlogs = logs.filter({$0.category == budget.name})
                let sortedLogs = filteredlogs.sorted(by: { $0.dateSelector.compare($1.dateSelector) == .orderedDescending })
                ForEach(sortedLogs) { log in
                    let logIndex = logs.firstIndex(of: log)! // get the index of the current log from logs
                    let keyDate = Date(timeIntervalSinceNow: -7 * 60 * 60 * 24)
                    if log.dateSelector > keyDate {
                        NavigationLink(destination: LogDetailView(log: $logs[logIndex], budgets: $budgets)) {
                            Image(systemName: log.icon)
                                .font(Font.system(size: 16))
                                .foregroundColor(Color(UIColor(named: "AccentColor") ?? .blue))
                                .frame(minWidth: 30)
                            
                            VStack(alignment: .leading) {
                                Text(log.name)
                                    .font(.headline)
                                    .lineLimit(1)
                                Text(log.dateSelector.getFormattedDate(format: "d MMM yyyy"))
                                    .font(.subheadline)
                                    .lineLimit(1)
                            }
                            .frame(width: 100, alignment: .leading)
                            
                            Spacer()
                            
                            Text("$\(String(format: "%.2f", log.amount))")
                                .foregroundColor(.red)
                                .minimumScaleFactor(0.7)
                                .lineLimit(1)
                        }
                        .onAppear(){
                            expenses += log.amount
                            expensesPresent += 1
                        }
                        .onDisappear(){
                            expenses -= log.amount
                            expensesPresent = 0
                        }
                    }
                }
                .onDelete { offsets in
                    for i in offsets {
                        if let found = logs.firstIndex(where: { $0 == sortedLogs[i] }) {
                            logs.remove(at: found)
                        }
                    }
                }
                if expensesPresent == 0 {
                    HStack {
                        Spacer()
                        Text("No expenses within this week")
                        Spacer()
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

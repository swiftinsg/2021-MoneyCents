//
//  HomeView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var isNewLogPresented = false
    @Binding var logs: [Log]
    @Binding var budgets: [Budget]
    @State var newLog: Log = Log(name: "",
                                 icon: "bag",
                                 amount: 0,
                                 category: "",
                                 details: "")
    @State var editLogViewAction: SheetAction = .cancel
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack() {
                        Spacer()
                        VStack(){
                            Text("Balance")
                                .font(.system(size: 18))
                                .foregroundColor(CustomColor.LightPurple)
                            Text("$300")
                                .foregroundColor(.white)
                                .font(.system(size: 60).weight(.bold))
                            Text("Expenses: $300")
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding()
                    .listRowBackground(Color(UIColor(named: "AccentColor") ?? .blue))
                }
                
                Section(header: Text("Recent Transactions")) {
                    let sortedLogs = logs.sorted(by: { $0.dateSelector.compare($1.dateSelector) == .orderedDescending })
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
            .listStyle(InsetGroupedListStyle()) // for iOS 15 list style on iOS 14
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        editLogViewAction = .cancel
                        newLog = Log(name: "",
                                     icon: "bag",
                                     amount: 0,
                                     category: "",
                                     details: "")
                        isNewLogPresented = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $isNewLogPresented, onDismiss: {
            if editLogViewAction == .done {
                logs.append(newLog)
            }
        }) {
            EditLogView(log: $newLog, budgets: $budgets, action: $editLogViewAction, isEdit: false)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(logs: .constant([
            Log(name: "Milo", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: 1.00, category: "A", details: "")
        ]),
                 budgets: .constant([])
        )
    }
}

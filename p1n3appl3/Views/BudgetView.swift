//
//  BudgetView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI

struct BudgetView: View {
    
    @State var isNewBudgetPresented = false
    @Binding var budgets: [Budget]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: Text("Second View")) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Food")
                            }
                            Spacer()
                            Text("$40.00")
                                .foregroundColor(.red)
                        }
                    }
                    
                    NavigationLink(destination: Text("Second View")) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Transport")
                            }
                            Spacer()
                            Text("$5.00")
                                .foregroundColor(.red)
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: Text("Second View")){
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Total")
                            }
                            Spacer()
                            Text("$45.00")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle()) // for iOS 15 list style on iOS 14
            .navigationTitle("Budget")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isNewBudgetPresented = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $isNewBudgetPresented) {
            NewBudgetView(budgets: $budgets)
        }
    }
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView(budgets: .constant([]))
    }
}

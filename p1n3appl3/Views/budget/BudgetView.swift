//
//  BudgetView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI

struct BudgetView: View {
    
    @Binding var budgets: [Budget]
    @State var budget = Budget(name: "", amount: 0.00)
    
    @State var showSheet: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    @State var selection = 0
    
    @State var enteredAmountText = ""
    var enteredAmountDouble: Double {
        return (Double(enteredAmountText) ?? 0) / 100
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: FoodDetailView()) {
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
                        showSheet.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
                
            }
            .halfSheet(showSheet: $showSheet) {
                // Your Half Sheet View....
                ZStack{
                    VStack{
                        NavigationView {
                            Form {
                                Section {
                                    TextField("Name", text: $budget.name)
                                    
                                    HStack {
                                        Text("Amount")
                                        ZStack(alignment: .trailing) {
                                            Text(String(format: "%.2f", enteredAmountDouble))
                                            
                                            TextField("", text: $enteredAmountText, onEditingChanged: { (_) in
                                                budget.amount = enteredAmountDouble
                                                print(budget.amount)
                                            })
                                                .keyboardType(.numberPad)
                                            // .accentColor(.clear) // removes the cursor
                                                .foregroundColor(.clear) // hides the text inputted
                                        }
                                        .multilineTextAlignment(.trailing)
                                    }
                                }
                            }
                            .navigationTitle("New Budget")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarItems(
                                leading:
                                    Button("Cancel") {
                                        showSheet.toggle()
                                    }
                                    .foregroundColor(.red),
                                trailing:
                                    Button("Save") {
                                        budgets.append(budget)
                                        showSheet.toggle()
                                    }
                            )
                        }
                    }
                }
                .ignoresSafeArea()
            } onEnd: {
                print("Dismissed")
            }
        }
    }
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView(budgets: .constant([Budget(name: "", amount: 0.00)]))
    }
}

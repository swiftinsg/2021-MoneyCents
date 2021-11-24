//
//  NewBudgetView.swift
//  MoneyCents
//
//  Created by Conqueriings on 19/11/21.
//

// Incase 
import SwiftUI

struct NewBudgetView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var budgets: [Budget]
    @State var budget = Budget(name: "", amount: 0.00)
    
    @State var selection = 0
    
    @State var enteredAmountText = ""
    var enteredAmountDouble: Double {
        return (Double(enteredAmountText) ?? 0) / 100
    }
    
    let catergory = ["Food","Transport","Entertainment", "Others"]
    
    var body: some View {
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
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.red),
                trailing:
                    Button("Save") {
                        budgets.append(budget)
                        presentationMode.wrappedValue.dismiss()
                    }
            )
        }
    }
}

struct NewBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        NewBudgetView(budgets: .constant([]))
    }
}

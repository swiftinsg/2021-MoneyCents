//
//  NewBudgetView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 19/11/21.
//

// Incase 
import SwiftUI

struct NewBudgetView: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var budgets: [Budget]
    @State var budget = Budget(nameOfItem: "", amount: "")
    @State var selection = 0
    var enteredAmountDouble: Double {
        return (Double(budget.amount) ?? 0) / 100
    }
    let catergory = ["Food","Transport","Entertainment", "Others"]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $budget.nameOfItem)
                    
                    HStack {
                        Text("Amount")
                        
                        ZStack(alignment: .trailing) {
                            Text("\(enteredAmountDouble, specifier: "%.2f")")
                            
                            TextField("", text: $budget.amount)
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

//
//  NewGoalsView.swift
//  p1n3appl3
//
//  Created by sap on 11/17/21.
//

import SwiftUI

struct NewGoalsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var goals: [Goal]
    @State var goal = Goal(name: "",
                           amount: "")
    
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    TextField("Name", text: $goal.name)
                        .disableAutocorrection(true)
                    TextField("Amount", text: $goal.amount)
                        .keyboardType(.numberPad)
                    
                }
            }
            .navigationTitle("New Goal")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.red),
                trailing:
                    Button("Save") {
                        presentationMode.wrappedValue.dismiss()
                    }
            )
        }
    }
}

struct NewGoalsView_Previews: PreviewProvider {
    static var previews: some View {
        NewGoalsView(goals: .constant([]))
    }
}

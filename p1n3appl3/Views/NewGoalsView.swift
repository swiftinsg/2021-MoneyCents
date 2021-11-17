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
    @State var goal = Goal(Name: "",
                         Amount: "")

    var body: some View {
        NavigationView{
        Form {
            Section() {
                TextField("Name", text: $goal.Name)
                    .disableAutocorrection(true)
                TextField("Amount", text: $goal.Amount)
                    .keyboardType(.numberPad)
                
            }
            
            Section {
                Button("Save") {
                    goals.append(goal)
                    presentationMode.wrappedValue.dismiss()
                }
                Button("Discard") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.red)
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

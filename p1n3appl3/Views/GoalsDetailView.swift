//
//  GoalsDetailView.swift
//  p1n3appl3
//
//  Created by sap on 11/19/21.
//

import SwiftUI

struct GoalsDetailView: View {
    
    @Binding var goal: Goal
    @State var isGoalsEditPresented = false
    @State var editedGoal = Goal(name: "",
                           amount: "")
    
    var body: some View {
        List {
            Section(header: Text("Information")) {
                Text(goal.name)
                Text(goal.amount)
            }
        }
        .navigationTitle(goal.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isGoalsEditPresented.toggle()
                }, label: {
                    Text("Edit")
                })
            }
        }
        .sheet(isPresented: $isGoalsEditPresented) {
            // insert present code here
            NavigationView {
                Form {
                    Section {
                        TextField("\(goal.name)", text: $editedGoal.name)
                            .disableAutocorrection(true)
                        TextField("\(goal.amount)", text: $editedGoal.amount)
                            .keyboardType(.numberPad)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            isGoalsEditPresented = false
                        }, label: {
                            Text("Cancel")
                        })
                    }

                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isGoalsEditPresented = false
                            if editedGoal.name != "" {
                                goal.name = editedGoal.name
                            }
                            if editedGoal.amount != "" {
                                goal.amount = editedGoal.amount
                            }
                        }, label: {
                            Text("Save")
                                .bold()
                        })
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct GoalsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsDetailView(goal: .constant(Goal(name: "Polishing Cloth", amount: "$29.00")))
        
        /*(goal: .constant(Goal(name: "Polishing Cloth", amount: "$29.00")))*/
    }
}

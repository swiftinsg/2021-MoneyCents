//
//  GoalsDetailView.swift
//  p1n3appl3
//
//  Created by sap on 11/19/21.
//

import SwiftUI

struct GoalsDetailView: View {
    
    @Binding var goal: Goal
    @State var temporaryGoal = Goal(name: "", amount: "")
    
    var body: some View {
        Form {
                TextField("\(goal.name)", text: $goal.name)
                    .disableAutocorrection(true)
                TextField("\(goal.amount)", text: $goal.amount)
                    .keyboardType(.numberPad)
        }
        /*.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    temporaryGoal.name = currentGoal[0].name
                    temporaryGoal.amount = currentGoal[0].amount
                    currentGoal[0].name = goal.name
                    currentGoal[0].amount = goal.amount
                    goal.name = temporaryGoal.name
                    goal.amount = temporaryGoal.amount
                }, label: {
                    Text("Switch")
                        .foregroundColor(CustomColor.Cornflower)
                })
            }
        }*/
    }
}

struct GoalsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsDetailView(goal: .constant(Goal(name: "Polishing Cloth", amount: "$29.00")))
    }
}

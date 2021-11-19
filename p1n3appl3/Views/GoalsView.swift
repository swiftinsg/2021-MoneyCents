//
//  GoalsView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI

struct GoalsView: View {

    @State private var futureCompleted = 0
    @State private var switchNumber = 0
    @State var switchPickerNumber = 0
    @State var isNewGoalPresented = false
    @State var goals = [Goal(name: "Polishing Cloth no. 1",
                             amount: "$29.00"),
                        Goal(name: "Polishing Cloth no. 2",
                             amount: "$29.00")]
    @State var currentGoal = [Goal(name: "Polishing Cloth",
                                   amount: "$29.00")]

    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: Text("Second View")){
                        VStack (alignment: .leading) {
                            HStack {
                                Text(currentGoal[0].name)
                                 .foregroundColor(.white)
                                 Spacer()
                                 Text("$2.00 / \(currentGoal[0].amount)")
                                 .foregroundColor(.white)
                            }
                            .padding(.top)
                            ProgressView(value: 2, total: 29)
                                .padding(.bottom)
                                .accentColor(.white)
                        }
                    }
                    .listRowBackground(CustomColor.Cornflower)
                }
                
                Section(header: Text("Other Goals")) {
                    Picker ("Time", selection: $futureCompleted) {
                        Text("Future").tag(0)
                        Text("Completed").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .padding(.vertical)
                    
                    if futureCompleted == 0 {
                        ForEach(goals){ goal in
                            let goalIndex = goals.firstIndex(of: goal)!
                            
                            NavigationLink(destination: GoalsDetailView(goal: $goals[goalIndex])) {
                                VStack (alignment: .leading) {
                                    HStack {
                                        Text(goal.name)
                                        Spacer()
                                        Text("$2.00 / \(goal.amount)")
                                    }
                                    .padding(.top)
                                    ProgressView(value: 2, total: 29)
                                        .padding(.bottom)
                                        .accentColor(CustomColor.Cornflower)
                                }
                            }
                        }
                        .onDelete { offsets in
                            goals.remove(atOffsets: offsets)
                        }
                        .onMove{ source, destination in
                            goals.move(fromOffsets: source, toOffset: destination)
                        }
                    } else {
                        NavigationLink(destination: Text("Second View")) {
                            VStack (alignment: .leading) {
                                HStack {
                                    Text("Polishing Cloth")
                                    Spacer()
                                    Text("$2.00 / $29.00")
                                }
                                .padding(.top)
                                
                                ProgressView(value: 2, total: 29)
                                    .padding(.bottom)
                                    .accentColor(CustomColor.Cornflower)
                            }
                        }
                        
                        NavigationLink(destination: Text("Second View")) {
                            VStack (alignment: .leading) {
                                HStack {
                                    Text("Polishing Cloth")
                                    Spacer()
                                    Text("$2.00 / $29.00")
                                }
                                .padding(.top)
                                
                                ProgressView(value: 2, total: 29)
                                    .padding(.bottom)
                                    .accentColor(CustomColor.Cornflower)
                            }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle()) // for iOS 15 list style on iOS 14
            .navigationTitle("Goals")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    /*Picker (selection: $switchNumber, label: Text("Switch")) {
                     ForEach(goals){ goal in
                     Text(goal.name).tag(switchPickerNumber)
                     }
                     }.pickerStyle(.menu)
                     .accentColor(CustomColour.Cornflower)*/
                    EditButton()
                        .foregroundColor(CustomColor.Cornflower)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isNewGoalPresented = true
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(CustomColor.Cornflower)
                    })
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $isNewGoalPresented) {
            NewGoalsView(goals: $goals)
        }
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}

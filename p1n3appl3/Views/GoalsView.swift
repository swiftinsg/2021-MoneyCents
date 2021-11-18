//
//  GoalsView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI

struct GoalsView: View {
    
    @State private var futureCompleted = 0
    @State var isNewGoalPresented = false
    @Binding var goals: [Goal]
    
    var body: some View {
        NavigationView {
            List {
                Section() {
                    VStack (alignment: .leading) {
                        HStack {
                            Text("Polishing Cloth")
                                .foregroundColor(.white)
                            Spacer()
                            Text("$2.00 / $29.00")
                                .foregroundColor(.white)
                        }
                        .padding(.top)
                        ProgressView(value: 2, total: 29)
                            .padding(.bottom)
                            .accentColor(.white)
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
                    } else {
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
                        
                        VStack (alignment: .leading) {
                            HStack {
                                Text("Polisihing Cloth")
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
            .listStyle(InsetGroupedListStyle()) // for iOS 15 list style on iOS 14
            .navigationTitle("Goals")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isNewGoalPresented = true
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(CustomColor.Cornflower)
                    })
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        
                    }, label: {
                        Text("Switch")
                            .foregroundColor(CustomColor.Cornflower)
                    })
                }
            }
        }
        .sheet(isPresented: $isNewGoalPresented) {
            NewGoalsView(goals: $goals)
        }
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView(goals: .constant([]))
    }
}

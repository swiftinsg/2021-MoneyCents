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
    
    struct CustomColour {
        static let BlueT = Color("Blue Titmouse")
        static let Cornflower = Color("Cornflower Blue")
        static let LightNavy = Color("Light Navy")
        static let HawkesB = Color("Hawkes Blue")
        static let LightCyan = Color("Light Cyan")
    }
    
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
                    .listRowBackground(CustomColour.Cornflower)
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
                                .accentColor(CustomColour.Cornflower)
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
                                .accentColor(CustomColour.Cornflower)
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
                                .accentColor(CustomColour.Cornflower)
                        }
                    }
                }
            }
            .navigationTitle("Goals")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isNewGoalPresented = true
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(CustomColour.Cornflower)
                    })
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        
                    }, label: {
                        Text("Switch")
                            .foregroundColor(CustomColour.Cornflower)
                    })
                }
            }
        }.sheet(isPresented: $isNewGoalPresented) {
            NewGoalsView(goals: $goals)}
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView(goals: .constant([]))
    }
}

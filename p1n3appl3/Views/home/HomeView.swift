//
//  HomeView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var isNewLogPresented = false
    @Binding var logs: [Log]
    
    var body: some View {
        NavigationView {
            List {
                Section {
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
                
                Section(header: Text("Recent Transactions")) {
                    ForEach(logs) { log in
                        let logIndex = logs.firstIndex(of: log)! // get the index of the current log from logs
                        
                        NavigationLink(destination: LogDetailView(log: $logs[logIndex])) {
                            
                            VStack(alignment: .leading) {
                                Text(log.name)
                                    .font(.headline)
                                Text(log.dateSelector, style: .date)
                                    .font(.subheadline)
                            }
                            Spacer()
                            Text(String(format: "%.2f", log.amount))
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle()) // for iOS 15 list style on iOS 14
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isNewLogPresented = true
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(CustomColor.Cornflower)
                    })
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $isNewLogPresented) {
            NewLogView(logs: $logs)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(logs: .constant([
            Log(name: "Milo", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: 1.00, category: "A", details: "")
        ]))
    }
}

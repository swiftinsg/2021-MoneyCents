//
//  ContentView.swift
//  p1n3appl3
//
//  Created by Yikun Zhou on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var logs = [
        Log(name: "Milo", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: 1.00, category: "", details: "During break"),
        Log(name: "Food", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: 2.50, category: "", details: "Break time"),
        Log(name: "Bag", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: 3.00, category: "", details: "Shopping"),
        Log(name: "Pen", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: 1.70, category: "", details: "Ran out of ink"),
    ]
    
    var body: some View {
        
        // Tab view
        
        TabView {
            // Home
            HomeView(logs: $logs)
                .tabItem {
                    Image(uiImage: UIImage(systemName: "house")!.imageWithoutBaseline())
                    Text("Home")
                }
            // History
            HistoryView()
                .tabItem {
                    Image(uiImage: UIImage(systemName: "chart.bar")!.imageWithoutBaseline())
                    Text("History")
                }
            
            //Budget
            BudgetView(budgets: .constant([]))
                .tabItem {
                    Image(uiImage: UIImage(systemName: "dollarsign.circle")!.imageWithoutBaseline())
                    Text("Budget")
                }
            
            // Goals
            GoalsView()
                .tabItem {
                    Image(uiImage: UIImage(systemName: "list.dash")!.imageWithoutBaseline())
                    Text("Goals")
                }
            
            // Settings
            SettingsView()
                .tabItem {
                    Image(uiImage: UIImage(systemName: "gear")!.imageWithoutBaseline())
                    Text("Settings")
                }
        }
        .accentColor(CustomColor.Cornflower)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

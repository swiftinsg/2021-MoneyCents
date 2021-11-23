//
//  ContentView.swift
//  p1n3appl3
//
//  Created by Yikun Zhou on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    @Binding var logs: [Log]
    @Binding var budgets: [Budget]
    
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
            HistoryView(logs: $logs)
                .tabItem {
                    Image(uiImage: UIImage(systemName: "chart.bar")!.imageWithoutBaseline())
                    Text("History")
                }
            
            //Budget
            BudgetView(budgets: $budgets, logs: $logs)
                .tabItem {
                    Image(uiImage: UIImage(systemName: "dollarsign.circle")!.imageWithoutBaseline())
                    Text("Budget")
                }
            
            // Goals
            /*
            GoalsView()
                .tabItem {
                    Image(uiImage: UIImage(systemName: "list.dash")!.imageWithoutBaseline())
                    Text("Goals")
                }
             */
            
            // Settings
            SettingsView()
                .tabItem {
                    Image(uiImage: UIImage(systemName: "gear")!.imageWithoutBaseline())
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(logs: .constant([]), budgets: .constant([]))
    }
}

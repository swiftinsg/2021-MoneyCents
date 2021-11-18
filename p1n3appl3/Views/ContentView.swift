//
//  ContentView.swift
//  p1n3appl3
//
//  Created by Yikun Zhou on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        // Tab view
        
        TabView {
            // Home
            HomeView(logs: .constant([]))
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            // History
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "chart.bar")
                }
            
            //Budget
            BudgetView()
                .tabItem {
                    Label("Budget", systemImage: "dollarsign.circle")
                }
            
            // Goals
            GoalsView(goals: .constant([]))
                .tabItem {
                    Label("Goals", systemImage: "list.dash")
                }
            
            // Settings
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
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

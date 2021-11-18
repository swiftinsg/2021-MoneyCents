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
            HomeView(logs: .constant([
                Log(name: "Milo", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: "1.00", category: "", details: "During break"),
                Log(name: "Food", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: "2.50", category: "", details: "Break time"),
                Log(name: "Bag", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: "3.00", category: "", details: "Shopping"),
                Log(name: "Pen", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: "1.70", category: "", details: "Ran out of ink"),
            ]))
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
            GoalsView()
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

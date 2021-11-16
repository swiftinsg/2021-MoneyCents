//
//  ContentView.swift
//  p1n3appl3
//
//  Created by Yikun Zhou on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    
    // Custom colours according to pallet
    // Darkest > Lightest shade
    struct CustomColour {
        static let BlueT = Color("Blue Titmouse")
        static let Cornflower = Color("Cornflower Blue")
        static let LightNavy = Color("Light Navy")
        static let HawkesB = Color("Hawkes Blue")
        static let LightCyan = Color("Light Cyan")
    }
 
    var body: some View {
        
        // Tab view
        
        TabView {
            // Home
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            // History
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "chart.xyaxis.line")
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
        .accentColor(CustomColour.Cornflower)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

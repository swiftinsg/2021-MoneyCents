//
//  BudgetDetailView.swift
//  p1n3appl3
//
//  Created by SAP on 20/11/21.
//

import SwiftUI

struct BudgetDetailView: View {
    var body: some View {
        NavigationView{
            List {
                Section(header: Text("Recent Transcations")) {
                    
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct BudgetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetDetailView()
    }
}

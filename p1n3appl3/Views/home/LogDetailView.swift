//
//  HomeMiloView.swift
//  p1n3appl3
//
//  Created by SAP on 17/11/21.
//

import SwiftUI

struct LogDetailView: View {
    
    @State var isEditPresented:Bool = false
    @Binding var log: Log
    @State var editLogViewAction: SheetAction = .cancel
    
    var body: some View {
        List {
            Section(header: Text("Information")) {
                Text(log.name)
                Text(log.dateSelector, style: .date)
                Text(String(format: "%.2f", log.amount))
                Text(log.details)
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("\(log.name)")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    editLogViewAction = .cancel
                    isEditPresented.toggle()
                }, label: {
                    Text("Edit")
                })
            }
        }
        .sheet(isPresented: $isEditPresented) {
            EditLogView(log: $log, action: $editLogViewAction, isEdit: true)
        }
    }
}

struct LogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LogDetailView(log: .constant(
            Log(name: "Milo", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: 1.0, category: "A", details: "Bought at school canteen during break")
        ))
    }
}

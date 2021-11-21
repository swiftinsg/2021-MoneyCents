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
    
    var body: some View {
        List {
            Section(header: Text("Information")) {
                Text(log.name)
                Text(log.dateSelector, style: .date)
                Text(String(format: "%.2f", log.amount))
                Text(log.details)
            }
        }
        .navigationTitle("Milo")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isEditPresented.toggle()
                }, label: {
                    Text("Edit")
                })
            }
        }
        .sheet(isPresented: $isEditPresented) {
            // insert present code here
            SheetView(isEditPresented: $isEditPresented, tempLog: log, log: $log)
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

struct SheetView: View {
    
    @State private var text = ""
    @Binding var isEditPresented:Bool
    @State var tempLog: Log
    @Binding var log: [Log]
    
    
    
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Milo",text: $tempLog)
                   /* TextField("Name", text: $text)
                    TextField("Amount", text: $text)
                    TextField("Description", text: $text)
                  */
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save"){
                        isEditPresented = false
                     tempLog = log
                    }
                }
                

            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

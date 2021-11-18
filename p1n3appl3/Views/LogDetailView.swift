//
//  HomeMiloView.swift
//  p1n3appl3
//
//  Created by SAP on 17/11/21.
//

import SwiftUI

struct LogDetailView: View {
    
    @State var isEditPresented = false
    @Binding var log: Log
    @State private var text = ""
    
    var body: some View {
        List {
            Section(header: Text("Information")) {
                Text(log.name)
                Text(log.dateSelector, style: .date)
                Text(log.amount)
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
            NavigationView {
                List {
                    Section {
                        TextField("Milo",text: $text)
                        TextField("Name", text: $text)
                        TextField("Amount", text: $text)
                        TextField("Description", text: $text)
                        
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            isEditPresented = false
                        }, label: {
                            Text("Cancel")
                                .foregroundColor(.red)
                        })
                    }

                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isEditPresented = false
                        }, label: {
                            Text("Save")
                        })
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
struct LogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LogDetailView(log: .constant(
            Log(name: "Milo", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: "1.0", category: "A", details: "Bought at school canteen during break")
        ))
    }
}

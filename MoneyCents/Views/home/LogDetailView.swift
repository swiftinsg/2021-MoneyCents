//
//  HomeMiloView.swift
//  MoneyCents
//
//  Created by SAP on 17/11/21.
//

import SwiftUI

struct LogDetailView: View {
    
    @State var isEditPresented:Bool = false
    @Binding var log: Log
    @Binding var budgets: [Budget]
    @State var editLogViewAction: SheetAction = .cancel
    
    var body: some View {
        List {
            Section(header: Text("Information")) {
                HStack {
                    Image(systemName: "tray")
                        .foregroundColor(.gray)
                        .font(Font.system(size: 16))
                        .frame(minWidth: 24)
                    
                    Text("Name")
                    Spacer()
                    Text(log.name)
                }
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.gray)
                        .font(Font.system(size: 16))
                        .frame(minWidth: 24)
                    Text("Date")
                    Spacer()
                    Text(log.dateSelector, style: .date)
                }
                HStack {
                    Image(systemName: "dollarsign.square")
                        .foregroundColor(.gray)
                        .font(Font.system(size: 16))
                        .frame(minWidth: 24)
                    Text("Amount")
                    Spacer()
                    Text("$\(String(format: "%.2f", log.amount))")
                }
                HStack {
                    Image(systemName: "info.circle")
                        .foregroundColor(.gray)
                        .font(Font.system(size: 16))
                        .frame(minWidth: 24)
                    Text("Icon")
                    Spacer()
                    Image(systemName: log.icon)
                    Text(log.icon)
                }
                HStack {
                    Image(systemName: "folder")
                        .foregroundColor(.gray)
                        .font(Font.system(size: 16))
                        .frame(minWidth: 24)
                    Text("Category")
                    Spacer()
                    Text(log.category)
                }
                
                
                HStack {
                    Image(systemName: "text.alignleft")
                        .foregroundColor(.gray)
                        .font(Font.system(size: 16))
                        .frame(minWidth: 24)
                    Text("Details")
                    Spacer()
                    Text(log.details)
                }
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
            EditLogView(log: $log, budgets: $budgets, action: $editLogViewAction, isEdit: true)
        }
    }
}

struct LogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LogDetailView(log: .constant(
            Log(name: "Milo", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: 1.0, category: "A", details: "Bought at school canteen during break")
        ),
                      budgets: .constant([])
        )
    }
}

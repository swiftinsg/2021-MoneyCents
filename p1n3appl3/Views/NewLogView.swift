//
//  NewLogView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 16/11/21.
//

import SwiftUI

struct NewLogView: View {
    
    @State var selection = 0 // for picker
    let catergory = ["Food","Transport","Entertainment"]
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var logs: [Log]
    
    // segmented picker
    @State private var logPicker = 0
    //
    @State var log = Log(name: "",
                         icon: "bag",
                         amount: "",
                         category: "",
                         details: "")
    
    @State var dateSelector = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("New Log", selection: $logPicker) {
                        Text("Allowance").tag(0)
                        Text("Expense").tag(1)
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Information")) {
                    TextField("Name", text: $log.name)
                        .disableAutocorrection(true)
                    DatePicker("Date", selection: $dateSelector, displayedComponents: .date)
                    TextField("Amount", text: $log.amount)
                        .keyboardType(.numberPad)
                    
                    HStack {
                        Image(systemName: log.icon)
                        TextField("Icon", text: $log.icon)
                            .autocapitalization(.none)
                    }
                    
                    HStack {
                        Text("Category")
                        Spacer()
                        Picker(selection: $selection, label: Text("Category")) {
                            ForEach(0 ..< catergory.count) { index in
                                Text(self.catergory[index]).tag(index)
                            }
                        }.pickerStyle(.menu)
                    }
                    
                }
                
                Section(header: Text("Optional")) {
                    
                    TextEditor(text: $log.details)
                    
                    
                }
            }
            .navigationTitle("New Log")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        logs.append(log)
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Save")
                            .bold()
                    })
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NewLogView_Previews: PreviewProvider {
    static var previews: some View {
        NewLogView(logs: .constant([]))
    }
}

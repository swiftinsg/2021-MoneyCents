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
    @State var enteredAmountText = ""
    
    // segmented picker
    @State private var logPicker = 0
    //
    @State var log = Log(name: "",
                         icon: "bag",
                         amount: 0,
                         category: "",
                         details: "")
    
    @State var dateSelector = Date()
    
    @State private var isSFSymbolPickerPresented = false
    
    var enteredAmountDouble: Double {
        return (Double(enteredAmountText) ?? 0) / 100
    }
    
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
                    HStack {
                        Text("Name")
                        TextField("", text: $log.name)
                            .disableAutocorrection(true)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    DatePicker("Date", selection: $dateSelector, displayedComponents: .date)
                    
                    HStack {
                        Text("Amount")
                        
                        ZStack(alignment: .trailing) {
                            Text(String(format: "%.2f", enteredAmountDouble))
                            
                            TextField("", text: $enteredAmountText, onEditingChanged: { (_) in
                                log.amount = enteredAmountDouble
                                print(log.amount)
                            })
                                .keyboardType(.numberPad)
                                // .accentColor(.clear) // removes the cursor
                                .foregroundColor(.clear) // hides the text inputted
                        }
                        .multilineTextAlignment(.trailing)
                    }
                    
                    HStack {
                        Text("Icon")

                        Spacer()
                        
                        Button(action: {
                            isSFSymbolPickerPresented = true
                        }, label: {
                            HStack {
                                Image(systemName: log.icon)
                                Text(log.icon)
                            }
                        })
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
                    TextField("Details (e.g. location)", text: $log.details)
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
        .sheet(isPresented: $isSFSymbolPickerPresented) {
            SFSymbolPickerView(log: $log)
        }
    }
}

struct NewLogView_Previews: PreviewProvider {
    static var previews: some View {
        NewLogView(logs: .constant([]))
    }
}

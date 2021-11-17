//
//  NewLogView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 16/11/21.
//

import SwiftUI


struct NewLogView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var logs: [Log]
    
    // segmented picker
    @State private var logPicker = 0
    //
    @State var log = Log(Name: "",
                         Amount: "",
                         Category: "",
                         Details: "")
    
    @State var dateSelector = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(){
                    Picker("New Log", selection: $logPicker) {
                        Text("Allowance").tag(0)
                        Text("Expense").tag(1)
                    }
                    .pickerStyle(.segmented)
                }
                Section(header: Text("Information")) {
                    TextField("Name", text: $log.Name)
                        .disableAutocorrection(true)
                    DatePicker("Date", selection: $dateSelector, displayedComponents: .date)
                    TextField("Amount", text: $log.Amount)
                        .keyboardType(.numberPad)
                    TextField("Category", text: $log.Category)
                    
                }
                
                Section(header: Text("Optional")) {
                    TextField("Details (eg. place)", text: $log.Details)
                }
                
                Section {
                    Button("Save") {
                        logs.append(log)
                        presentationMode.wrappedValue.dismiss()
                    }
                    Button("Discard") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("New Log")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                    leading:
                        Button("Cancel") {
                            
                        }
                        .foregroundColor(.red),
                    trailing:
                        Button("Done") {
                            
                        }
                )
        }
    }
}



struct NewLogView_Previews: PreviewProvider {
    static var previews: some View {
        NewLogView(logs: .constant([]))
    }
}

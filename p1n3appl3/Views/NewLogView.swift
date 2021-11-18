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
                         icon: "",
                         amount: "",
                         category: "",
                         details: "",
                         type: [.others])
    
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
                    TextField("Name", text: $log.name)
                        .disableAutocorrection(true)
                    DatePicker("Date", selection: $dateSelector, displayedComponents: .date)
                    TextField("Amount", text: $log.amount)
                        .keyboardType(.numberPad)
                    
                    
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
                    TextField("Details (eg. place)", text: $log.details)
                }
            }
            .navigationTitle("New Log")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.red),
                trailing:
                    Button("Save") {
                        logs.append(log)
                        presentationMode.wrappedValue.dismiss()
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

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
    @State var Name = ""
    @State var dateSelector = Date()
    @State var Amount = ""
    @State var Category = ""
    @State var Details = ""
    
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section(header: Text("")){
                    Picker("New Log", selection: $logPicker) {
                        Text("Allowance").tag(0)
                        Text("Expense").tag(1)
                    }
                    .pickerStyle(.segmented)
                }
                Section(header: Text("Information")) {
                    TextField("Name", text: $Name)
                        .disableAutocorrection(true)
                    DatePicker("Date", selection: $dateSelector, displayedComponents: .date)
                    TextField("Amount", text: $Amount)
                        .keyboardType(.numberPad)
                    TextField("Category", text: $Category)
                    
                }
                
                Section(header: Text("Optional")) {
                    TextField("Details (eg. place)", text: $Details)
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

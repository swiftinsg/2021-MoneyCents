//
//  HomeMiloView.swift
//  p1n3appl3
//
//  Created by SAP on 17/11/21.
//

import SwiftUI

struct LogDetailView: View {
    
    @State var isEditPresented = false
    @State private var text = ""
    
    
    var body: some View {
        
        List{
            Section(header: Text("Information")) {
                Text("24 Octorber 2021")
                Text("$0.80")
                Text("Food")
                Text("bought at school canteen during break")
                //WIP
            }
        }.navigationTitle("Milo") //WIP
        
            .navigationBarItems(trailing: Button(action: {
                isEditPresented.toggle()
            }, label: {
                Text("Edit")
            }))
            .sheet(isPresented: $isEditPresented) {
                //insert present code here
                NavigationView{
                    List{
                        Section{
                         
                     
                            TextField("Milo",text: $text)
                                TextField("Name", text: $text)
                                TextField("Amount", text: $text)
                                TextField("Description", text: $text)
                            
                        }
                    }
                   
                    
                    
                        .navigationBarItems(
                            leading:
                                Button("Cancel") {
                                    isEditPresented = false
                                }.foregroundColor(.red),
                            trailing:
                                Button("Save"){
                                    isEditPresented = false
                                }
                        )
                }
            }
    }
}
struct LogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LogDetailView()
    }
}

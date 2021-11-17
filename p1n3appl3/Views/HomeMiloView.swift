//
//  HomeMiloView.swift
//  p1n3appl3
//
//  Created by SAP on 17/11/21.
//

import SwiftUI

struct HomeMiloView: View {
    
    @State var isEditLogPresented = false
    
    var body: some View {
        NavigationView{
            List{
            
            
                Section(header: Text("Information")) {
                    Text("24 Octorber 2021")
                    Text("$0.80")
                    Text("Food")
                    Text("bought at school canteen during break")
                    //WIP
                }
            }.navigationTitle("Milo") //WIP
        }
    }
}
struct HomeMiloView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMiloView()
    }
}

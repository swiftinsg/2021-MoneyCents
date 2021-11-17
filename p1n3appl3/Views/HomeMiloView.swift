//
//  HomeMiloView.swift
//  p1n3appl3
//
//  Created by SAP on 17/11/21.
//

import SwiftUI

struct HomeMiloView: View {
    var body: some View {
        NavigationView{
            List{
                Section{
                  
                }
                Section(header: Text("Information")) {
                    Text("MIlo")
                    Text("Date")
                    Text("Amount")
                    Text("Category")
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

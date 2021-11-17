//
//  SettingsView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Name")) {
                    HStack {
                        Image(systemName: "person").foregroundColor(.gray)
                        TextField("Name",
                                  text:$name )
                            .padding(1)
                    }
                }
                
                Section(header: Text("Information")) {
                    HStack{
                        Image(systemName: "dollarsign.square").foregroundColor(.gray)
                        Text("Total savings")
                        Spacer()
                        Text("$49.00")
                        //WIP
                    }
                    
                    HStack{
                        Image(systemName: "line.3.horizontal").foregroundColor(.gray)
                        Text("Version number")
                        Spacer()
                        Text("1.0")
                    }
                    
                    HStack{
                        Image(systemName: "calendar").foregroundColor(.gray)
                        Text("Date joined")
                        Spacer()
                        Text("12/12/21")
                    }
                    
                    HStack{
                        NavigationLink(destination:SettingsCreditView()) {
                            HStack {
                                Image(systemName: "face.smiling").foregroundColor(.gray)
                                Text("Credits")
                            }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle()) // for iOS 15 list style on iOS 14
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

//
//  SettingsCreditView.swift
//  p1n3appl3
//
//  Created by SAP on 17/11/21.
//

import SwiftUI

struct SettingsCreditView: View {
    
    let team: [String] = ["Wei Xuan","Yikun","Dominic","Junrui"]
    let specialThanks:[String] = ["Jia Chen","YJ","Granwyn","Rochelle"]
    
    var body: some View {
        List {
            Section(header: Text("The Team")) {
                ForEach(team.indices) { index in
                    VStack {
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                            Text("\(team[index])")
                        }
                    }
                }      
            }
            
            Section(header:Text("Special thanks")) {
                ForEach(specialThanks.indices) { index in
                    VStack {
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                            Text("\(specialThanks[index])")
                        }
                    }
                }
            }
        }
    }
}

struct SettingsCreditView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCreditView()
    }
}

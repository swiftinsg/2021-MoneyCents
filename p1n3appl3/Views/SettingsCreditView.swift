//
//  SettingsCreditView.swift
//  p1n3appl3
//
//  Created by SAP on 17/11/21.
//

import SwiftUI

struct SettingsCreditView: View {
    var body: some View {
        List{
            Section(header:Text("The team")){
                HStack{
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    Text("Wei Xuan")
                }
                HStack{
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    Text("Yikun")
                }
                HStack{
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    Text("Dominic")
                }
                HStack{
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    Text("Junrui")
                }
            }
            Section(header:Text("Special thanks")){
                HStack{
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    Text("Jia Chen")
                }
                HStack{
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    Text("Granwyn")
                }
                HStack{
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    Text("Rochelle")
                }
                HStack{
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    Text("YJ")
                }
                .navigationTitle("Credits")
            }
        }
        
    }
}

struct SettingsCreditView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCreditView()
    }
}

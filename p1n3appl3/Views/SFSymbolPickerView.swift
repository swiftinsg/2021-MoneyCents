//
//  SFSymbolPickerView.swift
//  p1n3appl3
//
//  Created by Yikun Zhou on 19/11/21.
//

import SwiftUI
import SFSymbolsPicker

struct SFSymbolPickerView: View {
    @State private var isSFSymbolsPickerPresented = true
    @Binding var log: Log
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Choose an icon or enter its name:")
                        .font(.headline)
                    Image(uiImage: UIImage(systemName: log.icon) ?? UIImage(systemName: "questionmark.square.fill")!)
                    TextField("", text: $log.icon)
                        .autocapitalization(.none)
                        .multilineTextAlignment(.center)
                }
                .padding()
                Divider()
                
                SFSymbolsPicker(isPresented: $isSFSymbolsPickerPresented, icon: $log.icon, category: .p1n3appl3, axis: .vertical, haptic: false)
                // .devices
                // .objects
                // .health
            }
            .navigationTitle(Text("Icon"))
        }
    }
}

struct SFSymbolPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolPickerView(log: .constant(Log(name: "Milo", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: 1.00, category: "", details: "During break")))
    }
}

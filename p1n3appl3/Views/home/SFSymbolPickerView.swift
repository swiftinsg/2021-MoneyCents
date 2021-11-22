//
//  SFSymbolPickerView.swift
//  p1n3appl3
//
//  Created by Yikun Zhou on 19/11/21.
//

import SwiftUI
import SFSymbolsPicker

struct SFSymbolPickerView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment (\.colorScheme) var colorScheme:ColorScheme
    @State private var isSFSymbolsPickerPresented = true
    @Binding var log: Log
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("Choose an icon or enter its name:")
                        .font(.headline)
                    
                    if colorScheme == .light {
                        Image(uiImage: UIImage(systemName: log.icon) ?? UIImage(systemName: "questionmark.square.fill")!)
                    } else {
                        Image(uiImage: UIImage(systemName: log.icon) ?? UIImage(systemName: "questionmark.square.fill")!).colorInvert()
                    }
                    
                    TextField("", text: $log.icon)
                        .autocapitalization(.none)
                        .multilineTextAlignment(.center)
                }
                .padding()
                
                Divider()
                
                SFSymbolsPicker(isPresented: $isSFSymbolsPickerPresented, icon: $log.icon, category: .p1n3appl3, axis: .vertical, haptic: false)
                // .p1n3appl3 is a combination of .devices, .objects, and .health
            }
            .navigationTitle(Text("Icon"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Done")
                    })
                }
            }
        }
    }
}

struct SFSymbolPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolPickerView(log: .constant(Log(name: "Milo", icon: "bag", dateSelector:Date(timeIntervalSinceReferenceDate: 658316460), amount: 1.00, category: "", details: "During break")))
    }
}

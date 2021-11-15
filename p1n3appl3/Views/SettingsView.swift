//
//  SettingsView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
            .font(.system(size: 30, weight: .semibold))
            .padding(.top,20)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

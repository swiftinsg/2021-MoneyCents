//
//  GoalsView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI

struct GoalsView: View {
    var body: some View {
        VStack {
            Text("Goals")
            .font(.system(size: 30, weight: .semibold))
            .padding(.top,20)
        }
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}

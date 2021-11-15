//
//  HistoryView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI

struct HistoryView: View {
    @State private var Yaxis = 0
    @State private var Xaxis = 0
    
    var body: some View {
        
            // banner
            VStack(alignment: .center, spacing: 20) {
                Text("History")
                    .font(.system(size: 30, weight: .semibold))
                    .padding(.top,20)
                
                // Y-Axis & Segmented picker
                VStack {
                    Text("Y-axis")
                        .font(.system(size: 20, weight: .semibold))
                        .offset(x: -120, y: 40)
                    Picker("Y-Axis", selection: $Yaxis) {
                        Text("Week").tag(0)
                        Text("Month").tag(1)
                        Text("Year").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 350, height: 100)
                }
                
                // X-axis & Segmented picker
                VStack {
                    Text("X-axis")
                        .font(.system(size: 20, weight: .semibold))
                        .offset(x: -120)
                    Picker("Xaxis", selection: $Xaxis) {
                        Text("Total").tag(0)
                        Text("").tag(1)
                        Text("").tag(2)
                        Text("").tag(3)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 350, height: 100)
                }
            }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
       HistoryView()
    }
}

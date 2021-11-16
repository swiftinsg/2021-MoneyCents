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
        NavigationView {
            List {
                Section {
                    VStack {
                        // Y-Axis & Segmented picker
                        VStack (alignment: .leading) {
                            Text("Y-axis")
                                .font(.headline)
                            Picker("Y-Axis", selection: $Yaxis) {
                                Text("Week").tag(0)
                                Text("Month").tag(1)
                                Text("Year").tag(2)
                            }
                            .pickerStyle(.segmented)
                        }
                        .padding(10)

                        // X-axis & Segmented picker
                        VStack (alignment: .leading) {
                            Text("X-axis")
                                .font(.headline)
                            Picker("Xaxis", selection: $Xaxis) {
                                Text("Total").tag(0)
                                Text("").tag(1)
                                Text("").tag(2)
                                Text("").tag(3)
                            }
                            .pickerStyle(.segmented)
                        }
                        .padding(10)
                    }
                }
            }
            .navigationTitle("History")
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

//
//  HistoryView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI
import SwiftUICharts

struct HistoryView: View {
    @State private var Yaxis = 0
    @State private var Xaxis = 0
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Chart()
                }
                
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

struct Chart: View {
    var body: some View {
        VStack {
            LineView(
                data: [8,23,54,32,12,37,7,23,43],
                //                title: "Line chart",
                legend: "Full screen"
            )
            HStack {
                Group {
                    Spacer()
                    Text("S")
                }
                Group {
                    Spacer()
                    Text("M")
                }
                Group {
                    Spacer()
                    Text("T")
                }
                Group {
                    Spacer()
                    Text("W")
                }
                Group {
                    Spacer()
                    Text("T")
                }
                Group {
                    Spacer()
                    Text("F")
                }
                Group {
                    Spacer()
                    Text("S")
                }
            }
        }
        .frame(height:350)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}

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
                        .padding(.bottom)
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
            .listStyle(InsetGroupedListStyle()) // for iOS 15 list style on iOS 14
            .navigationTitle("History")
        }
    }
}

struct CustomStyle {
    static let light = ChartStyle(
        backgroundColor: Color.black.opacity(0), // no background colour
        accentColor: Color("Blue Titmouse"),
        secondGradientColor: Color("Cornflower Blue"),
        textColor: Color.black.opacity(0), // seems to have no effect
        legendTextColor: Color(UIColor.darkGray),
        dropShadowColor: Color.black.opacity(0) // seems to have no effect
    )
    
    static let dark = ChartStyle(
        backgroundColor: Color.black.opacity(0), // no background colour
        accentColor: Color("Blue Titmouse"),
        secondGradientColor: Color("Cornflower Blue"),
        textColor: Color.black.opacity(0), // seems to have no effect
        legendTextColor: Color.white,
        dropShadowColor: Color.black.opacity(0) // seems to have no effect
    )
    
    static var style: ChartStyle {
        let light = CustomStyle.light
        let dark = CustomStyle.dark
        light.darkModeStyle = dark
        let shortWeekdaySymbols = Calendar.current.shortWeekdaySymbols
        
        let localizedWeekdays: [String] = Array(shortWeekdaySymbols[Calendar.current.firstWeekday - 1 ..< Calendar.current.shortWeekdaySymbols.count] + shortWeekdaySymbols[0 ..< Calendar.current.firstWeekday - 1])
        let c = Calendar.current
        print(c) // prints "gregorian"
        let first = Calendar.current.firstWeekday // this is 2 !!!
        print(first)
        print(shortWeekdaySymbols, localizedWeekdays)
        return light
    }
}

struct Chart: View {
    var body: some View {
        VStack {
            LineView(
                data: [1,10,1,3,5,1,8],
                // title: "Line chart",
                legend: "Amount / $",
                style: CustomStyle.style
            )
            HStack {
                let localizedWeekdays: [String] = Array(Calendar.current.shortWeekdaySymbols[Calendar.current.firstWeekday - 1 ..< Calendar.current.shortWeekdaySymbols.count] + Calendar.current.shortWeekdaySymbols[0 ..< Calendar.current.firstWeekday - 1])
                ForEach(localizedWeekdays, id: \.self) { day in
                    Spacer()
                    Text(day)
                        .foregroundColor(Color.gray)
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

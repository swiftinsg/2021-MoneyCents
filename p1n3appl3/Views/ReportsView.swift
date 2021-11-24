//
//  ReportsView.swift
//  p1n3appl3
//
//  Created by Conqueriings on 15/11/21.
//

import SwiftUI
import SwiftUICharts

struct ReportsView: View {
    
    @Binding var logs: [Log]
    @State private var Yaxis = 0
    @State private var Xaxis = 0
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Chart(logs: $logs)
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
            .navigationTitle("Reports")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CustomStyle {
    static let light = ChartStyle(
        backgroundColor: Color.black.opacity(0), // no background colour
        accentColor: Color(UIColor(named: "AccentColor") ?? .blue),
        secondGradientColor: Color(UIColor(named: "AccentColor") ?? .blue),
        textColor: Color.black.opacity(0), // seems to have no effect
        legendTextColor: Color(UIColor.darkGray),
        dropShadowColor: Color.black.opacity(0) // seems to have no effect
    )
    
    static let dark = ChartStyle(
        backgroundColor: Color.black.opacity(0), // no background colour
        accentColor: Color(UIColor(named: "AccentColor") ?? .blue),
        secondGradientColor: Color(UIColor(named: "AccentColor") ?? .blue),
        textColor: Color.black.opacity(0), // seems to have no effect
        legendTextColor: Color.white,
        dropShadowColor: Color.black.opacity(0) // seems to have no effect
    )
    
    static var style: ChartStyle {
        let light = CustomStyle.light
        let dark = CustomStyle.dark
        light.darkModeStyle = dark
        return light
    }
}

func getSunday(date: Date) -> Date {
    let calendar = Calendar.current
    var components = calendar.dateComponents([.weekOfYear, .yearForWeekOfYear], from: date)
    components.weekday = 1 // Sunday is first day of week
    let sundayInWeek = calendar.date(from: components)!
    return sundayInWeek
}

func calculateData(logs: [Log]) -> [Double] {
    let sortedLogs = logs.sorted(by: { $0.dateSelector.compare($1.dateSelector) == .orderedDescending })
    
    var data: [Double] = [0, 0, 0, 0, 0, 0, 0]
    
    for log in sortedLogs {
        if log.dateSelector < getSunday(date: Date()) {
            break
        }
        
        let weekday = Calendar.current.component(.weekday, from: log.dateSelector) - 1 // becuase it starts from 1 instead of 0 (e.g. Sunday is 1, Monday is 2, etc.)
        data[weekday] += log.amount
    }
    
    return data
}

struct Chart: View {
    @Binding var logs: [Log]
    
    var body: some View {
        VStack {
            LineView(
                data: calculateData(logs: logs),
                // title: "Line chart",
                legend: "Amount / $",
                style: CustomStyle.style
            )
            HStack {
//                let localizedWeekdays: [String] = Array(Calendar.current.shortWeekdaySymbols[Calendar.current.firstWeekday - 1 ..< Calendar.current.shortWeekdaySymbols.count] + Calendar.current.shortWeekdaySymbols[0 ..< Calendar.current.firstWeekday - 1])
                let localizedWeekdays: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                ForEach(localizedWeekdays, id: \.self) { day in
                    Spacer()
                    Text(day)
                        .foregroundColor(Color.gray)
                        .scaledToFill()
                }
            }
        }
        .frame(height:350)
    }
}

struct ReportsView_Previews: PreviewProvider {
    static var previews: some View {
        ReportsView(logs: .constant([]))
    }
}

//
//  Extensions.swift
//  p1n3appl3
//
//  Created by Yikun Zhou on 22/11/21.
//

import SwiftUI

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

// To get custom accentColor to work on physical iOS 13 device
// from https://stackoverflow.com/questions/64350713/swiftui-custom-accentcolor-not-working-on-physical-deviceios-13-but-works-ever
extension Color {
    static var accent: Color {
        if #available(iOS 14.0, *) {
            return accentColor
        } else {
            return CustomColor.Cornflower
        }
    }
}

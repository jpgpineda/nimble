//
//  CVDateFormatter.swift
//  Nimble
//
//  Created by javier pineda on 09/11/23.
//

import Foundation

class CVDateFormatter {
    static let formatter = DateFormatter()
    static let mainFormat = "EEEE, LLLL dd"
    
    static func shortDate(_ date: Date) -> String {
        formatter.dateFormat = CVDateFormatter.mainFormat
        return formatter.string(from: date)
    }
}

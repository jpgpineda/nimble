//
//  String+Ext.swift
//  Nimble
//
//  Created by javier pineda on 05/11/23.
//

import Foundation

extension String {
    static let empty: String        = ""
    
    func isValidEmail() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", Regex.emailRegex)
        return emailTest.evaluate(with: self)
    }
}

//
//  StringLocalized.swift
//  Nimble
//
//  Created by javier pineda on 04/11/23.
//

import Foundation

extension String {
    struct Localized {
        // MARK: Login
        static var email: String { return getLocalizedString(#function) }
        static var password: String {
            return getLocalizedString(#function) }
        static var forgot: String { return getLocalizedString(#function) }
        static var login: String { return getLocalizedString(#function) }
        
        internal static func getLocalizedString(_ key: String) -> String {
            return NSLocalizedString(key, comment: key)
        }
    }
}

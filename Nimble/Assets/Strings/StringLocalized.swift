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
        static var nimble: String { return getLocalizedString(#function) }
        static var signUp: String { return getLocalizedString(#function) }
        
        // MARK: Welcome
        static var welcome: String { return getLocalizedString(#function) }
        static var begin: String { return getLocalizedString(#function) }
        
        // MARK: SignUp
        static var name: String { return getLocalizedString(#function) }
        static var confirmPassword: String { return getLocalizedString(#function) }
        
        // MARK: Tools
        static var ups: String { return getLocalizedString(#function) }
        static var congratsTitle: String { return getLocalizedString(#function) }
        static var signOut: String { return getLocalizedString(#function) }
        static var continueTitle: String { return getLocalizedString(#function) }
        
        // MARK: Success Messages
        static var accountCreated: String { return getLocalizedString(#function) }
        
        // MARK: Session
        static var tokenSoonToExpire: String { return getLocalizedString(#function) }
        static var renewSession: String { return getLocalizedString(#function) }
        
        // MARK: Survey list
        static var today: String { return getLocalizedString(#function) }
        
        internal static func getLocalizedString(_ key: String) -> String {
            return NSLocalizedString(key, comment: key)
        }
    }
}

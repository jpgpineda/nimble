//
//  SharedPreferences.swift
//  Nimble
//
//  Created by javier pineda on 07/11/23.
//

import Foundation

enum UserKeys: String {
    case lastSignedUser
}

struct UserPreferences {
    static let shared = UserPreferences()
    let defaults = UserDefaults.standard
    
    internal func saveLastSignedUser(email: String) {
        defaults.set(email, forKey: UserKeys.lastSignedUser.rawValue)
    }
    
    internal func getLastSignedUser() -> String {
        return defaults.string(forKey: UserKeys.lastSignedUser.rawValue) ?? .empty
    }
}

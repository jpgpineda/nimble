//
//  SignUpRequest.swift
//  Nimble
//
//  Created by javier pineda on 06/11/23.
//

import Foundation

struct SignUpRequest: Codable {
    let name: String
    let email: String
    let password: String
    let confirmPassword: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case email
        case password
        case confirmPassword = "password_confirmation"
    }
}

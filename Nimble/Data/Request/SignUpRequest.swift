//
//  SignUpRequest.swift
//  Nimble
//
//  Created by javier pineda on 06/11/23.
//

import Foundation

struct SignUpRequest: Codable {
    let user: UserInfo
    let clientId: String
    let clientSecret: String
    
    enum CodingKeys: String, CodingKey {
        case user
        case clientId = "client_id"
        case clientSecret = "client_secret"
    }
    
    init(user: UserInfo) {
        self.user = user
        clientId = Constants.clientId
        clientSecret = Constants.clientSecret
    }
}

struct UserInfo: Codable {
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

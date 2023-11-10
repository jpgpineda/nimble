//
//  SignInRequest.swift
//  Nimble
//
//  Created by javier pineda on 07/11/23.
//

import Foundation

struct SignInRequest: Codable {
    let grantType: String
    let email: String
    let password: String
    let clientId: String
    let clientSecret: String
    
    enum CodingKeys: String, CodingKey {
        case grantType = "grant_type"
        case email, password
        case clientId = "client_id"
        case clientSecret = "client_secret"
    }
    
    init(email: String, password: String) {
        grantType = Constants.grantType
        self.email = email
        self.password = password
        clientId = Constants.clientId
        clientSecret = Constants.clientSecret
    }
    
    init() {
        grantType = .empty
        email = .empty
        password = .empty
        clientId = .empty
        clientSecret = .empty
    }
}

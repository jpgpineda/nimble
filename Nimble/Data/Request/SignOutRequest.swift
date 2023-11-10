//
//  SignOutRequest.swift
//  Nimble
//
//  Created by javier pineda on 10/11/23.
//

import Foundation

struct SignOutRequest: Codable {
    let token: String
    let clientId: String = Constants.clientId
    let clientSecret: String = Constants.clientSecret
    
    enum CodingKeys: String, CodingKey {
        case token
        case clientId       = "client_id"
        case clientSecret   = "client_secret"
    }
}

//
//  SignInResponse.swift
//  Nimble
//
//  Created by javier pineda on 07/11/23.
//

import Foundation

struct SignInResponse: Codable {
    let data: SignInInfo
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct SignInInfo: Codable {
    let id: String
    let type: String
    let attributes: SignInAttributes
    
    enum CodingKeys: String, CodingKey {
        case id, type, attributes
    }
}

struct SignInAttributes: Codable {
    let accessToken: String
    let tokenType: String
    let expiresIn: Int64
    let refreshToken: String
    let createdAt: Int
    
    enum CodingKeys: String, CodingKey {
        case accessToken    = "access_token"
        case tokenType      = "token_type"
        case expiresIn      = "expires_in"
        case refreshToken   = "refresh_token"
        case createdAt      = "created_at"
    }
}

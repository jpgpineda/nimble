//
//  SignInResponseDTO.swift
//  Nimble
//
//  Created by javier pineda on 07/11/23.
//

import Foundation

struct SignInResponseDTO {
    let id: String
    let accessToken: String
    let expiresIn: Int64
    let refreshToken: String
    
    init(with response: SignInResponse) {
        id = response.data.id
        accessToken = response.data.attributes.accessToken
        expiresIn = response.data.attributes.expiresIn
        refreshToken = response.data.attributes.refreshToken
    }
}

//
//  UserDTO.swift
//  Nimble
//
//  Created by javier pineda on 09/11/23.
//

import Foundation

struct UserDTO {
    let name: String
    let avatarUrl: String
    
    init(with response: UserProfileResponse) {
        name = response.data.attributes.name
        avatarUrl = response.data.attributes.avatarURL
    }
    
    init() {
        name = .empty
        avatarUrl = .empty
    }
}

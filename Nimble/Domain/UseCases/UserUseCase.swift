//
//  UserUseCase.swift
//  Nimble
//
//  Created by javier pineda on 09/11/23.
//

import Foundation

protocol UserUseCase {
    var apiGateway: UserApiGateway { get set }
    func fetchUserProfile() async throws -> UserDTO
}

class UserUseCaseImplementation: UserUseCase {
    internal var apiGateway: UserApiGateway
    
    init(apiGateway: UserApiGateway) {
        self.apiGateway = apiGateway
    }
    
    func fetchUserProfile() async throws -> UserDTO {
        return try await UserDTO(with: apiGateway.fetchUserProfile())
    }
}

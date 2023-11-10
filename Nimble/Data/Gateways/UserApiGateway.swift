//
//  UserApiGateway.swift
//  Nimble
//
//  Created by javier pineda on 09/11/23.
//

protocol UserApiGateway {
    func fetchUserProfile() async throws -> UserProfileResponse
}

class UserApiGatewayImplementation: UserApiGateway {
    func fetchUserProfile() async throws -> UserProfileResponse {
        let response: UserProfileResponse = try await ApiRequestDispatcher.request(apiRouter: .fetchUserProfile)
        return response
    }
}

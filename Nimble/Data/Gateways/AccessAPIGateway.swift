//
//  AccessAPIGateway.swift
//  Nimble
//
//  Created by javier pineda on 07/11/23.
//

import Foundation

protocol AccessAPIGateway {
    func requestSignUp(parameters: SignUpRequest) async throws -> NoResponse
    func saveLastSignedUser(email: String)
    func getLastSignedUser() -> String
}

class AccessAPIGatewayImplementation: AccessAPIGateway {
    func requestSignUp(parameters: SignUpRequest) async throws -> NoResponse {
        let response: NoResponse = try await ApiRequestDispatcher.request(apiRouter: .signUp(parameters: parameters))
        return response
    }
    
    func saveLastSignedUser(email: String) {
        UserPreferences.shared.saveLastSignedUser(email: email)
    }
    
    func getLastSignedUser() -> String {
        return UserPreferences.shared.getLastSignedUser()
    }
}

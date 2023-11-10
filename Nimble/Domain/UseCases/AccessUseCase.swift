//
//  AccessUseCase.swift
//  Nimble
//
//  Created by javier pineda on 07/11/23.
//

import Foundation

protocol AccessUseCase {
    var apiGateway: AccessAPIGateway { get set }
    func requestSignUp(parameters: SignUpRequest) async throws -> NoResponse
    func requestSignIn(parameters: SignInRequest) async throws -> SignInResponseDTO
    func saveLastSignedUser(email: String)
    func getLastSignedUser() -> String
}

class AccessUseCaseImplementation: AccessUseCase {
    internal var apiGateway: AccessAPIGateway
    
    init(apiGateway: AccessAPIGateway) {
        self.apiGateway = apiGateway
    }
    
    func requestSignUp(parameters: SignUpRequest) async throws -> NoResponse {
        return try await apiGateway.requestSignUp(parameters: parameters)
    }
    
    func requestSignIn(parameters: SignInRequest) async throws -> SignInResponseDTO {
        let response = try await apiGateway.requestSignIn(parameters: parameters)
        return SignInResponseDTO(with: response)
    }
    
    func saveLastSignedUser(email: String) {
        apiGateway.saveLastSignedUser(email: email)
    }
    
    func getLastSignedUser() -> String {
        return apiGateway.getLastSignedUser()
    }
}

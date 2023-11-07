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
}

class AccessUseCaseImplementation: AccessUseCase {
    internal var apiGateway: AccessAPIGateway
    
    init(apiGateway: AccessAPIGateway) {
        self.apiGateway = apiGateway
    }
    
    func requestSignUp(parameters: SignUpRequest) async throws -> NoResponse {
        return try await apiGateway.requestSignUp(parameters: parameters)
    }
}

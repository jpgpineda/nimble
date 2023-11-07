//
//  AccessAPIGateway.swift
//  Nimble
//
//  Created by javier pineda on 07/11/23.
//

import Foundation

protocol AccessAPIGateway {
    func requestSignUp(parameters: SignUpRequest) async throws -> NoResponse
}

class AccessAPIGatewayImplementation: AccessAPIGateway {
    func requestSignUp(parameters: SignUpRequest) async throws -> NoResponse {
        let response: NoResponse = try await ApiRequestDispatcher.request(apiRouter: .signUp(parameters: parameters))
        return response
    }
}

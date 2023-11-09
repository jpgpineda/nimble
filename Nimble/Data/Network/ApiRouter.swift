//
//  ApiRouter.swift
//  Nimble
//
//  Created by javier pineda on 06/11/23.
//

import Foundation

enum ApiRouter {
    case signUp(parameters: SignUpRequest)
    case signIn(parameters: SignInRequest)
    
    var host: String {
        return "https://survey-api.nimblehq.co/api/v1"
    }
    
    var path: String {
        switch self {
        case .signUp:
            return "/registrations"
        case .signIn:
            return "//oauth/token"
        }
    }
    
    var stringUrl: String {
        return host + path
    }
    
    var method: String {
        switch self {
        case .signUp:
            return HttpMethod.POST
        case .signIn:
            return HttpMethod.POST
        }
    }
    
    var url: URLComponents {
        var components = URLComponents()
        components.host = host
        components.path = path
        return components
    }
    
    var body: Data? {
        switch self {
        case .signUp(let parameters):
            return try? JSONEncoder().encode(parameters)
        case .signIn(let parameters):
            return try? JSONEncoder().encode(parameters)
        }
    }
}

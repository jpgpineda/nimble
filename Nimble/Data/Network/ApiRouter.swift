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
    case fetchSurveys(parameters: FetchSurveysRequest)
    
    var host: String {
        return "https://survey-api.nimblehq.co/api/v1"
    }
    
    var path: String {
        switch self {
        case .signUp:
            return "/registrations"
        case .signIn:
            return "//oauth/token"
        case .fetchSurveys(let parameters):
            let formattedPath = String(format: "/surveys?page[number]=%d&page[size]=%d",
                                       parameters.pageNumber,
                                       parameters.pageSize)
            return formattedPath
        }
    }
    
    var stringUrl: String {
        return host + path
    }
    
    var token: String? {
        switch self {
        case .fetchSurveys:
            return TokenManager.shared.canRetrieveEncryptedCrendentials(id: TokenManager.shared.identifier)?.token
        default:
            return nil
        }
    }
    
    var method: String {
        switch self {
        case .signUp:
            return HttpMethod.POST
        case .signIn:
            return HttpMethod.POST
        case .fetchSurveys:
            return HttpMethod.GET
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
        case .fetchSurveys:
            return nil
        }
    }
}

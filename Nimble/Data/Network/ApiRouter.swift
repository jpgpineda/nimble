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
    case fetchUserProfile
    
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
        case .fetchUserProfile:
            return "/me"
        }
    }
    
    var stringUrl: String {
        switch self {
        case .signUp:
            return host + path
        case .signIn:
            return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil ? "https://run.mocky.io/v3/2392d983-1258-4055-8747-39f0409537af" : host + path
        case .fetchSurveys:
            return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil ? "https://run.mocky.io/v3/2e328818-c3ed-4884-bfb5-21917bc96945" : host + path
        case .fetchUserProfile:
            return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil ? "https://run.mocky.io/v3/7104e12a-99d6-4631-b42b-f5bad0139514" : host + path
        }
    }
    
    var token: String? {
        guard ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil else { return nil }
        switch self {
        case .fetchSurveys, .fetchUserProfile:
            return TokenManager.shared.canRetrieveEncryptedCrendentials(id: TokenManager.shared.identifier)?.token
        default:
            return nil
        }
    }
    
    var method: String {
        guard ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil else { return HttpMethod.GET }
        switch self {
        case .signUp, .signIn:
            return HttpMethod.POST
        case .fetchSurveys, .fetchUserProfile:
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
        guard ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil else { return nil }
        switch self {
        case .signUp(let parameters):
            return try? JSONEncoder().encode(parameters)
        case .signIn(let parameters):
            return try? JSONEncoder().encode(parameters)
        default:
            return nil
        }
    }
}

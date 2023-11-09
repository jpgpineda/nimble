//
//  SurveyApiGateway.swift
//  Nimble
//
//  Created by javier pineda on 09/11/23.
//

protocol SurveyApiGateway {
    func fetchSurveys(parameters: FetchSurveysRequest) async throws -> SurveyListResponse
}

class SurveyApiGatewayImplementation: SurveyApiGateway {
    func fetchSurveys(parameters: FetchSurveysRequest) async throws -> SurveyListResponse {
        let response: SurveyListResponse = try await ApiRequestDispatcher.request(apiRouter: .fetchSurveys(parameters: parameters))
        return response
    }
}

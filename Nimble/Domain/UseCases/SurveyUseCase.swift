//
//  SurveyUseCase.swift
//  Nimble
//
//  Created by javier pineda on 09/11/23.
//

import Foundation

protocol SurveyUseCase {
    var apiGateway: SurveyApiGateway { get set }
    func fetchSurveys(parameters: FetchSurveysRequest) async throws -> SurveyListDTO
}

class SurveyUseCaseImplementation: SurveyUseCase {
    internal var apiGateway: SurveyApiGateway
    
    init(apiGateway: SurveyApiGateway) {
        self.apiGateway = apiGateway
    }
    
    func fetchSurveys(parameters: FetchSurveysRequest) async throws -> SurveyListDTO {
        let response = SurveyListDTO(with: try await apiGateway.fetchSurveys(parameters: parameters))
        return response
    }
}

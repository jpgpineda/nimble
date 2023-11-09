//
//  SurveyListConfigurator.swift
//  Nimble
//
//  Created by javier pineda on 08/11/23.
//
 
protocol SurveyListConfigurator {
    func configure(_ controller: SurveyListViewController)
}

class SurveyListConfiguratorImplementation: SurveyListConfigurator {
    func configure(_ controller: SurveyListViewController) {
        // Apigateway
        let apiGateway = SurveyApiGatewayImplementation()
        // UseCase
        let useCase = SurveyUseCaseImplementation(apiGateway: apiGateway)
        // Router
        let router = SurveyListRouterImplementation(controller: controller)
        // Presenter
        let presenter = SurveyListPresenterImplementation(view: controller,
                                                          router: router,
                                                          useCase: useCase)
        // View
        controller.presenter = presenter
    }
}

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
        let userApiGateway = UserApiGatewayImplementation()
        // UseCase
        let useCase = SurveyUseCaseImplementation(apiGateway: apiGateway)
        let userUseCase = UserUseCaseImplementation(apiGateway: userApiGateway)
        // Router
        let router = SurveyListRouterImplementation(controller: controller)
        // Presenter
        let presenter = SurveyListPresenterImplementation(view: controller,
                                                          router: router,
                                                          useCase: useCase,
                                                          userUseCase: userUseCase)
        // View
        controller.presenter = presenter
    }
}

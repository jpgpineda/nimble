//
//  SurveyDetailConfigurator.swift
//  Nimble
//
//  Created by javier pineda on 10/11/23.
//
 
protocol SurveyDetailConfigurator {
    func configure(_ controller: SurveyDetailViewController)
}

class SurveyDetailConfiguratorImplementation: SurveyDetailConfigurator {
    func configure(_ controller: SurveyDetailViewController) {
        // ApiClient
        
        // Apigateway
        
        // UseCase
        
        // Interactor
        
        // Router
        let router = SurveyDetailRouterImplementation(controller: controller)
        // Presenter
        let presenter = SurveyDetailPresenterImplementation(view: controller,
                                              router: router)
        // View
        controller.presenter = presenter
    }
}

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
        // ApiClient
        
        // Apigateway
        
        // UseCase
        
        // Interactor
        
        // Router
        let router = SurveyListRouterImplementation(controller: controller)
        // Presenter
        let presenter = SurveyListPresenterImplementation(view: controller,
                                              router: router)
        // View
        controller.presenter = presenter
    }
}

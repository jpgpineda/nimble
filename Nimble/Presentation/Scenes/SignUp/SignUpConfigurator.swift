//
//  SignUpConfigurator.swift
//  Nimble
//
//  Created by javier pineda on 06/11/23.
//
 
protocol SignUpConfigurator {
    func configure(_ controller: SignUpViewController)
}

class SignUpConfiguratorImplementation: SignUpConfigurator {
    func configure(_ controller: SignUpViewController) {
        // ApiClient
        
        // Apigateway
        
        // UseCase
        
        // Interactor
        
        // Router
        let router = SignUpRouterImplementation(controller: controller)
        // Presenter
        let presenter = SignUpPresenterImplementation(view: controller,
                                              router: router)
        // View
        controller.presenter = presenter
    }
}

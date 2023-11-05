//
//  LoginConfigurator.swift
//  Nimble
//
//  Created by javier pineda on 05/11/23.
//
 
protocol LoginConfigurator {
    func configure(_ controller: LoginViewController)
}

class LoginConfiguratorImplementation: LoginConfigurator {
    func configure(_ controller: LoginViewController) {
        // ApiClient
        
        // Apigateway
        
        // UseCase
        
        // Interactor
        
        // Router
        let router = LoginRouterImplementation(controller: controller)
        // Presenter
        let presenter = LoginPresenterImplementation(view: controller,
                                              router: router)
        // View
        controller.presenter = presenter
    }
}

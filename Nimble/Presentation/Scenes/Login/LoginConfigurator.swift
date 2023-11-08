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
        // Apigateway
        let apiGateway = AccessAPIGatewayImplementation()
        // UseCase
        let useCase = AccessUseCaseImplementation(apiGateway: apiGateway)
        // Router
        let router = LoginRouterImplementation(controller: controller)
        // Presenter
        let presenter = LoginPresenterImplementation(view: controller,
                                                     router: router, useCase: useCase)
        // View
        controller.presenter = presenter
    }
}

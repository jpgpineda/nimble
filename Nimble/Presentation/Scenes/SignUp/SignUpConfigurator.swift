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
        // Apigateway
        let apiGateway = AccessAPIGatewayImplementation()
        // UseCase
        let useCase = AccessUseCaseImplementation(apiGateway: apiGateway)
        // Router
        let router = SignUpRouterImplementation(controller: controller)
        // Presenter
        let presenter = SignUpPresenterImplementation(view: controller,
                                                      router: router, accessUseCase: useCase)
        // View
        controller.presenter = presenter
    }
}

//
//  DrawerMenuConfigurator.swift
//  Nimble
//
//  Created by javier pineda on 10/11/23.
//
 
protocol DrawerMenuConfigurator {
    func configure(_ controller: DrawerMenuViewController)
}

class DrawerMenuConfiguratorImplementation: DrawerMenuConfigurator {
    func configure(_ controller: DrawerMenuViewController) {
        // ApiClient
        
        // Apigateway
        
        // UseCase
        
        // Interactor
        
        // Router
        let router = DrawerMenuRouterImplementation(controller: controller)
        // Presenter
        let presenter = DrawerMenuPresenterImplementation(view: controller,
                                              router: router)
        // View
        controller.presenter = presenter
    }
}

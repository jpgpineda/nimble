//
//  DrawerMenuRouter.swift
//  Nimble
//
//  Created by javier pineda on 10/11/23.
//

protocol DrawerMenuRouter {
    func dismissView()
}

class DrawerMenuRouterImplementation: DrawerMenuRouter {
    private let controller: DrawerMenuViewController
    
    init(controller: DrawerMenuViewController) {
        self.controller = controller
    }
    
    func dismissView() {
        controller.dismiss(animated: true)
    }
}

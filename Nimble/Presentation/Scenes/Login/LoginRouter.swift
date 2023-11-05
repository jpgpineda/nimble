//
//  LoginRouter.swift
//  Nimble
//
//  Created by javier pineda on 05/11/23.
//

protocol LoginRouter {
    
}

class LoginRouterImplementation: LoginRouter {
    private let controller: LoginViewController
    
    init(controller: LoginViewController) {
        self.controller = controller
    }
}

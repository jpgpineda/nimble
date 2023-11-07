//
//  LoginRouter.swift
//  Nimble
//
//  Created by javier pineda on 05/11/23.
//

protocol LoginRouter {
    func dismissView()
    func presentSignUp()
}

class LoginRouterImplementation: LoginRouter {
    private let controller: LoginViewController
    
    init(controller: LoginViewController) {
        self.controller = controller
    }
    
    func dismissView() {
        controller.navigationController?.popViewController(animated: true)
    }
    
    func presentSignUp() {
        
    }
}

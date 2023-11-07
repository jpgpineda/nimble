//
//  SignUpRouter.swift
//  Nimble
//
//  Created by javier pineda on 06/11/23.
//

protocol SignUpRouter {
    func dismissView()
}

class SignUpRouterImplementation: SignUpRouter {
    private let controller: SignUpViewController
    
    init(controller: SignUpViewController) {
        self.controller = controller
    }
    
    func dismissView() {
        controller.navigationController?.popViewController(animated: true)
    }
}

//
//  Dependencies.swift
//  Nimble
//
//  Created by javier pineda on 05/11/23.
//

import Swinject

protocol AccessDependency {
    var container: Container { get set }
    func makeLogInViewController() -> LoginViewController?
    func makeSignUpViewController() -> SignUpViewController?
}

class AccessDependencyImplementation: AccessDependency {
    var container: Container
    
    init(container: Container) {
        self.container = container
        registerLoginViewController()
        registerSignUpViewController()
    }
    
    private func registerLoginViewController() {
        container.register(LoginViewController.self) { _ in
            return LoginViewController()
        }
    }
    
    func makeLogInViewController() -> LoginViewController? {
        return container.resolve(LoginViewController.self)
    }
    
    private func registerSignUpViewController() {
        container.register(SignUpViewController.self) { _ in
            return SignUpViewController()
        }
    }
    
    func makeSignUpViewController() -> SignUpViewController? {
        return container.resolve(SignUpViewController.self)
    }
}

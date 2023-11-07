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
}

class AccessDependencyImplementation: AccessDependency {
    var container: Container
    
    init(container: Container) {
        self.container = container
        registerLoginViewController()
    }
    
    private func registerLoginViewController() {
        container.register(LoginViewController.self) { _ in
            return LoginViewController()
        }
    }
    
    func makeLogInViewController() -> LoginViewController? {
        return container.resolve(LoginViewController.self)
    }
}

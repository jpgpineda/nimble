//
//  LoginPresenter.swift
//  Nimble
//
//  Created by javier pineda on 05/11/23.
//

import UIKit

protocol LoginView {

}

protocol LoginPresenter {
    var view: LoginView { get set }
    var router: LoginRouter { get set }
    var email: String { get set }
    var password: String { get set }
    func dismissView()
    func presentSignUp()
    func requestLogin()
    func validateField() -> Bool
}

class LoginPresenterImplementation: LoginPresenter {
    internal var view: LoginView
    internal var router: LoginRouter
    internal var email: String = .empty
    internal var password: String = .empty
    
    init(view: LoginView,
         router: LoginRouter) {
        self.view = view
        self.router = router
    }
    
    func requestLogin() {
        
    }
    
    func dismissView() {
        router.dismissView()
    }
    
    func presentSignUp() {
        router.presentSignUp()
    }
    
    func validateField() -> Bool {
        var isValid = true
        if email.isEmpty || !email.isValidEmail() {
            isValid = false
        }
        if password.isEmpty {
            isValid = false
        }
        return isValid
    }
}
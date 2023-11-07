//
//  SignUpPresenter.swift
//  Nimble
//
//  Created by javier pineda on 06/11/23.
//

import UIKit

protocol SignUpView {
    
}

protocol SignUpPresenter {
    var view: SignUpView { get set }
    var router: SignUpRouter { get set }
    var name: String { get set }
    var email: String { get set }
    var password: String { get set }
    var confirmPassword: String { get set }
    func dismissView()
    func validateFields() -> Bool
}

class SignUpPresenterImplementation: SignUpPresenter {
    internal var view: SignUpView
    internal var router: SignUpRouter
    internal var name: String = .empty
    internal var email: String = .empty
    internal var password: String = .empty
    internal var confirmPassword: String = .empty
    
    init(view: SignUpView,
         router: SignUpRouter) {
        self.view = view
        self.router = router
    }
    
    func dismissView() {
        router.dismissView()
    }
    
    func validateFields() -> Bool {
        var isValid = true
        if name.isEmpty {
            isValid = false
        }
        if email.isEmpty || !email.isValidEmail() {
            isValid = false
        }
        if password.isEmpty {
            isValid = false
        }
        if confirmPassword.isEmpty {
            isValid = false
        }
        return isValid
    }
}

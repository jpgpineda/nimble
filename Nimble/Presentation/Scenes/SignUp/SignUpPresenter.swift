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
    var useCase: AccessUseCase { get set }
    var name: String { get set }
    var email: String { get set }
    var password: String { get set }
    var confirmPassword: String { get set }
    func requestSignUp()
    func dismissView()
    func validateFields() -> Bool
}

class SignUpPresenterImplementation: SignUpPresenter {
    internal var view: SignUpView
    internal var router: SignUpRouter
    internal var useCase: AccessUseCase
    internal var name: String = .empty
    internal var email: String = .empty
    internal var password: String = .empty
    internal var confirmPassword: String = .empty
    
    init(view: SignUpView,
         router: SignUpRouter,
         accessUseCase: AccessUseCase) {
        self.view = view
        self.router = router
        self.useCase = accessUseCase
    }
    
    func requestSignUp() {
        let parameters = SignUpRequest(name: name,
                                       email: email,
                                       password: password,
                                       confirmPassword: confirmPassword)
        Task.init {
            do {
                try await useCase.requestSignUp(parameters: parameters)
                
            } catch {
                
            }
        }
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

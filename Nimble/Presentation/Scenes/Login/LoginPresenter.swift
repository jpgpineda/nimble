//
//  LoginPresenter.swift
//  Nimble
//
//  Created by javier pineda on 05/11/23.
//

import UIKit

protocol LoginView {
    func showSuccess(message: String)
    func showFailure(message: String)
    func sheduleTokenExpiration(duration: Int64)
}

protocol LoginPresenter {
    var view: LoginView { get set }
    var router: LoginRouter { get set }
    var useCase: AccessUseCase { get set }
    var email: String { get set }
    var password: String { get set }
    func dismissView()
    func presentSignUp()
    func requestLogin()
    func validateField() -> Bool
    func getLastSignedUser() -> String
}

class LoginPresenterImplementation: LoginPresenter {
    internal var view: LoginView
    internal var router: LoginRouter
    internal var useCase: AccessUseCase
    internal var email: String = .empty
    internal var password: String = .empty
    
    init(view: LoginView,
         router: LoginRouter,
         useCase: AccessUseCase) {
        self.view = view
        self.router = router
        self.useCase = useCase
    }
    
    func requestLogin() {
        let parameters = SignInRequest(email: email, password: password)
        router.showLoaderView()
        Task.init {
            do {
                let response = try await useCase.requestSignIn(parameters: parameters)
                guard useCase.canEncryptCredentials(credential: CredentialDTO(id: response.id, token: response.accessToken)) else { return }
                view.sheduleTokenExpiration(duration: response.expiresIn)
                router.presentHome()
                router.dismissLoaderView()
            } catch {
                router.dismissLoaderView()
                view.showFailure(message: error.localizedDescription)
            }
        }
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
    
    func getLastSignedUser() -> String {
        return useCase.getLastSignedUser()
    }
}

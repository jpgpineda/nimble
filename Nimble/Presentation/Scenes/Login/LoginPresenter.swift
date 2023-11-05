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
}

class LoginPresenterImplementation: LoginPresenter {
    internal var view: LoginView
    internal var router: LoginRouter
    
    init(view: LoginView,
         router: LoginRouter) {
        self.view = view
        self.router = router
    }
}

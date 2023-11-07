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
    func dismissView()
}

class SignUpPresenterImplementation: SignUpPresenter {
    internal var view: SignUpView
    internal var router: SignUpRouter
    
    init(view: SignUpView,
         router: SignUpRouter) {
        self.view = view
        self.router = router
    }
    
    func dismissView() {
        router.dismissView()
    }
}

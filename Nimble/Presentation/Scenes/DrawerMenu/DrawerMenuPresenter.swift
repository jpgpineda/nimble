//
//  DrawerMenuPresenter.swift
//  Nimble
//
//  Created by javier pineda on 10/11/23.
//

import UIKit

protocol DrawerMenuView {
    
}

protocol DrawerMenuPresenter {
    var view: DrawerMenuView { get set }
    var router: DrawerMenuRouter { get set }
    func dismissView()
}

class DrawerMenuPresenterImplementation: DrawerMenuPresenter {
    internal var view: DrawerMenuView
    internal var router: DrawerMenuRouter
    
    init(view: DrawerMenuView,
         router: DrawerMenuRouter) {
        self.view = view
        self.router = router
    }
    
    func dismissView() {
        router.dismissView()
    }
}

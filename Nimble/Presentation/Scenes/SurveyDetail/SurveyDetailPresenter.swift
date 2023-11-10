//
//  SurveyDetailPresenter.swift
//  Nimble
//
//  Created by javier pineda on 10/11/23.
//

import UIKit

protocol SurveyDetailView {
    
}

protocol SurveyDetailPresenter {
    var view: SurveyDetailView { get set }
    var router: SurveyDetailRouter { get set }
    func dismissView()
}

class SurveyDetailPresenterImplementation: SurveyDetailPresenter {
    internal var view: SurveyDetailView
    internal var router: SurveyDetailRouter
    
    init(view: SurveyDetailView,
         router: SurveyDetailRouter) {
        self.view = view
        self.router = router
    }
    
    func dismissView() {
        router.dismissView()
    }
}

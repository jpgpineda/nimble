//
//  SurveyListPresenter.swift
//  Nimble
//
//  Created by javier pineda on 08/11/23.
//

import UIKit

protocol SurveyListView {
    
}

protocol SurveyListPresenter {
    var view: SurveyListView { get set }
    var router: SurveyListRouter { get set }
}

class SurveyListPresenterImplementation: SurveyListPresenter {
    internal var view: SurveyListView
    internal var router: SurveyListRouter
    
    init(view: SurveyListView,
         router: SurveyListRouter) {
        self.view = view
        self.router = router
    }
}

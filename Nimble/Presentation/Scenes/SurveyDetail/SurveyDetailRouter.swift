//
//  SurveyDetailRouter.swift
//  Nimble
//
//  Created by javier pineda on 10/11/23.
//

protocol SurveyDetailRouter {
    func dismissView()
}

class SurveyDetailRouterImplementation: SurveyDetailRouter {
    private let controller: SurveyDetailViewController
    
    init(controller: SurveyDetailViewController) {
        self.controller = controller
    }
    
    func dismissView() {
        controller.popView()
    }
}

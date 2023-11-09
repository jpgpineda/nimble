//
//  SurveyListRouter.swift
//  Nimble
//
//  Created by javier pineda on 08/11/23.
//

protocol SurveyListRouter {
    
}

class SurveyListRouterImplementation: SurveyListRouter {
    private let controller: SurveyListViewController
    
    init(controller: SurveyListViewController) {
        self.controller = controller
    }
}

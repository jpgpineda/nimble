//
//  SurveyListRouter.swift
//  Nimble
//
//  Created by javier pineda on 08/11/23.
//

protocol SurveyListRouter {
    func showLoaderView()
    func dismissLoaderView()
    func showMenu()
    func showSurveyDetail()
}

class SurveyListRouterImplementation: SurveyListRouter {
    private let controller: SurveyListViewController
    
    init(controller: SurveyListViewController) {
        self.controller = controller
    }
    
    func showLoaderView() {
        
    }
    
    func dismissLoaderView() {
        
    }
    
    func showMenu() {
        
    }
    
    func showSurveyDetail() {
        
    }
}

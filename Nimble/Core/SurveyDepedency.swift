//
//  SurveyDepedency.swift
//  Nimble
//
//  Created by javier pineda on 08/11/23.
//

import Swinject

protocol SurveyDepedency {
    var container: Container { get set }
    func makeSurveyListViewController() -> SurveyListViewController?
}

class SurveyDepedencyImplementation: SurveyDepedency {
    internal var container: Container
    
    init(container: Container) {
        self.container = container
        registerSurveyListViewController()
    }
    
    private func registerSurveyListViewController() {
        container.register(SurveyListViewController.self) { _ in
            return SurveyListViewController()
        }
    }
    
    func makeSurveyListViewController() -> SurveyListViewController? {
        return container.resolve(SurveyListViewController.self)
    }
}

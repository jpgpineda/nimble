//
//  SurveyDepedency.swift
//  Nimble
//
//  Created by javier pineda on 08/11/23.
//

import Swinject
import Foundation

protocol SurveyDepedency {
    var container: Container { get set }
    func makeSurveyListViewController() -> SurveyListViewController?
    func makeSurveyViewController(survey: SurveyDTO?,
                                  index: Int,
                                  delegate: SurveySelectionDelegate) -> SurveyViewController?
    func makeSurveyPageViewController() -> SurveyPageViewController?
    func makeSurveyDetailViewController(survey: SurveyDTO) -> SurveyDetailViewController?
}

class SurveyDepedencyImplementation: SurveyDepedency {
    internal var container: Container
    
    init(container: Container) {
        self.container = container
        registerSurveyListViewController()
        registerSurveyViewController()
        registerSurveyPageViewController()
        registerSurveyDetailViewController()
    }
    
    private func registerSurveyListViewController() {
        container.register(SurveyListViewController.self) { _ in
            return SurveyListViewController()
        }
    }
    
    func makeSurveyListViewController() -> SurveyListViewController? {
        return container.resolve(SurveyListViewController.self)
    }
    
    private func registerSurveyViewController() {
        container.register(SurveyViewController.self) { _ in
            return SurveyViewController()
        }
    }
    
    func makeSurveyViewController(survey: SurveyDTO?,
                                  index: Int,
                                  delegate: SurveySelectionDelegate) -> SurveyViewController? {
        guard let viewController = container.resolve(SurveyViewController.self) else { return nil }
        viewController.survey = survey
        viewController.index = index
        viewController.delegate = delegate
        return viewController
    }
    
    private func registerSurveyPageViewController() {
        container.register(SurveyPageViewController.self) { _ in
            return SurveyPageViewController()
        }
    }
    
    func makeSurveyPageViewController() -> SurveyPageViewController? {
        return container.resolve(SurveyPageViewController.self)
    }
    
    private func registerSurveyDetailViewController() {
        container.register(SurveyDetailViewController.self) { _ in
            return SurveyDetailViewController()
        }
    }
    
    func makeSurveyDetailViewController(survey: SurveyDTO) -> SurveyDetailViewController? {
        guard let viewController = container.resolve(SurveyDetailViewController.self) else { return nil }
        viewController.survey = survey
        return viewController
    }
}

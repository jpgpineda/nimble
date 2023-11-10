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
    func getSurveyView(_ survey: SurveyDTO?,
                       index: Int,
                       delegate: surveySelectionDelegate) -> SurveyViewController?
    func getSurveyPageViewController() -> SurveyPageViewController?
}

class SurveyListRouterImplementation: SurveyListRouter {
    private let controller: SurveyListViewController
    
    init(controller: SurveyListViewController) {
        self.controller = controller
    }
    
    func showLoaderView() {
        controller.showLoader()
    }
    
    func dismissLoaderView() {
        controller.dismissLoader()
    }
    
    func showMenu() {
        
    }
    
    func showSurveyDetail() {
        
    }
    
    func getSurveyView(_ survey: SurveyDTO?,
                       index: Int,
                       delegate: surveySelectionDelegate) -> SurveyViewController? {
        return ModuleManager.surveyDependency.makeSurveyViewController(survey: survey,
                                                                       index: index,
                                                                       delegate: delegate)
    }
    
    func getSurveyPageViewController() -> SurveyPageViewController? {
        return ModuleManager.surveyDependency.makeSurveyPageViewController()
    }
}

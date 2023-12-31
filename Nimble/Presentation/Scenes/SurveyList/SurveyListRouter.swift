//
//  SurveyListRouter.swift
//  Nimble
//
//  Created by javier pineda on 08/11/23.
//

protocol SurveyListRouter {
    func showLoaderView()
    func dismissLoaderView()
    func showMenu(user: UserDTO, delegate: SignOutDelegate)
    func presentSurveyDetail(survey: SurveyDTO)
    func getSurveyView(_ survey: SurveyDTO?,
                       index: Int,
                       delegate: SurveySelectionDelegate) -> SurveyViewController?
    func getSurveyPageViewController() -> SurveyPageViewController?
    func dismissView()
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
    
    func showMenu(user: UserDTO, delegate: SignOutDelegate) {
        guard let viewController = ModuleManager.toolsDependency.makeMenuViewController(user: user,
                                                                                        delegate: delegate,
                                                                                        drawerDelegate: DrawerTransitionManager()) else { return }
        controller.present(viewController, animated: true)
    }
    
    func presentSurveyDetail(survey: SurveyDTO) {
        guard let viewController = ModuleManager.surveyDependency.makeSurveyDetailViewController(survey: survey) else { return }
        controller.show(viewController, sender: nil)
    }
    
    func getSurveyView(_ survey: SurveyDTO?,
                       index: Int,
                       delegate: SurveySelectionDelegate) -> SurveyViewController? {
        return ModuleManager.surveyDependency.makeSurveyViewController(survey: survey,
                                                                       index: index,
                                                                       delegate: delegate)
    }
    
    func getSurveyPageViewController() -> SurveyPageViewController? {
        return ModuleManager.surveyDependency.makeSurveyPageViewController()
    }
    
    func dismissView() {
        controller.navigationController?.dismiss(animated: true, completion: {
            self.dismissLoaderView()
        })
    }
}

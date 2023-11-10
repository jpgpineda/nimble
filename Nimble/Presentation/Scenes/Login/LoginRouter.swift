//
//  LoginRouter.swift
//  Nimble
//
//  Created by javier pineda on 05/11/23.
//

protocol LoginRouter {
    func dismissView()
    func presentSignUp()
    func showLoaderView()
    func dismissLoaderView()
    func presentHome()
}

class LoginRouterImplementation: LoginRouter {
    private let controller: LoginViewController
    
    init(controller: LoginViewController) {
        self.controller = controller
    }
    
    func dismissView() {
        controller.navigationController?.popViewController(animated: true)
    }
    
    func presentSignUp() {
        guard let viewController = ModuleManager.accessDependency.makeSignUpViewController() else { return }
        controller.show(viewController, sender: nil)
    }
    
    func showLoaderView() {
        controller.showLoader()
    }
    
    func dismissLoaderView() {
        controller.dismissLoader()
    }
    
    func presentHome() {
        guard let viewController = ModuleManager.surveyDependency.makeSurveyListViewController() else { return }
        controller.presentNewFlow(rootView: viewController) {
            self.dismissLoaderView()
        }
    }
}

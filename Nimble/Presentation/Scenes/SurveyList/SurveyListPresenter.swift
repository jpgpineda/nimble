//
//  SurveyListPresenter.swift
//  Nimble
//
//  Created by javier pineda on 08/11/23.
//

import UIKit
import Foundation

protocol SurveyListView {
    func showFailure(message: String)
    func updateData(with surveys: [SurveyDTO])
    func updateUserInfo(user: UserDTO)
}

protocol SurveyListPresenter {
    var view: SurveyListView { get set }
    var router: SurveyListRouter { get set }
    var useCase: SurveyUseCase { get set }
    var userUseCase: UserUseCase { get set }
    var accessUseCase: AccessUseCase { get set }
    func fetchSurveys()
    func showMenu(delegate: SignOutDelegate)
    func presentSurveyDetail(survey: SurveyDTO)
    func getSurveyView(_ survey: SurveyDTO?,
                       index: Int,
                       delegate: SurveySelectionDelegate) -> SurveyViewController?
    func getSurveyPageViewController() -> SurveyPageViewController?
    func fetchUserInfo()
    func requestSignOut()
}

class SurveyListPresenterImplementation: SurveyListPresenter {
    internal var view: SurveyListView
    internal var router: SurveyListRouter
    internal var useCase: SurveyUseCase
    internal var userUseCase: UserUseCase
    internal var accessUseCase: AccessUseCase
    var user: UserDTO = UserDTO()
    
    init(view: SurveyListView,
         router: SurveyListRouter,
         useCase: SurveyUseCase,
         userUseCase: UserUseCase,
         accessUseCase: AccessUseCase) {
        self.view = view
        self.router = router
        self.useCase = useCase
        self.userUseCase = userUseCase
        self.accessUseCase = accessUseCase
    }
    
    func fetchSurveys() {
        let parameters = FetchSurveysRequest(pageNumber: .one, pageSize: .ten)
        router.showLoaderView()
        Task.init {
            do {
                let response = try await useCase.fetchSurveys(parameters: parameters)
                router.dismissLoaderView()
                DispatchQueue.main.async {
                    self.view.updateData(with: response.data)
                }
            } catch {
                router.dismissLoaderView()
                view.showFailure(message: error.localizedDescription)
            }
        }
    }
    
    func showMenu(delegate: SignOutDelegate) {
        router.showMenu(user: user, delegate: delegate)
    }
    
    func presentSurveyDetail(survey: SurveyDTO) {
        router.presentSurveyDetail(survey: survey)
    }
    
    func getSurveyView(_ survey: SurveyDTO?,
                       index: Int,
                       delegate: SurveySelectionDelegate) -> SurveyViewController? {
        return router.getSurveyView(survey, index: index, delegate: delegate)
    }
    
    func getSurveyPageViewController() -> SurveyPageViewController? {
        return router.getSurveyPageViewController()
    }
    
    func fetchUserInfo() {
        router.showLoaderView()
        Task.init {
            do {
                let response = try await userUseCase.fetchUserProfile()
                user = response
                router.dismissLoaderView()
                DispatchQueue.main.async {
                    self.view.updateUserInfo(user: response)

                }
            } catch {
                router.dismissLoaderView()
                view.showFailure(message: error.localizedDescription)
            }
        }
    }
    
    func requestSignOut() {
        let parameters = SignOutRequest(token: TokenManager.shared.canRetrieveEncryptedCrendentials(id: TokenManager.shared.identifier)?.token ?? .empty)
        router.showLoaderView()
        Task.init {
            do {
                try await accessUseCase.requestSignOut(parameters: parameters)
                DispatchQueue.main.async {
                    self.router.dismissView()
                }
            } catch {
                router.dismissLoaderView()
                view.showFailure(message: error.localizedDescription)
            }
        }
    }
}

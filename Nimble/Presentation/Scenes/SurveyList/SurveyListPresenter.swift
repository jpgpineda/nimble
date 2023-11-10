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
    func fetchSurveys()
    func presentMenu()
    func presentSurveyDetail()
    func getSurveyView(_ survey: SurveyDTO?,
                       index: Int,
                       delegate: surveySelectionDelegate) -> SurveyViewController?
    func getSurveyPageViewController() -> SurveyPageViewController?
    func fetchUserInfo()
}

class SurveyListPresenterImplementation: SurveyListPresenter {
    internal var view: SurveyListView
    internal var router: SurveyListRouter
    internal var useCase: SurveyUseCase
    internal var userUseCase: UserUseCase
    
    init(view: SurveyListView,
         router: SurveyListRouter,
         useCase: SurveyUseCase,
         userUseCase: UserUseCase) {
        self.view = view
        self.router = router
        self.useCase = useCase
        self.userUseCase = userUseCase
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
    
    func presentMenu() {
        router.showMenu()
    }
    
    func presentSurveyDetail() {
        router.showSurveyDetail()
    }
    
    func getSurveyView(_ survey: SurveyDTO?,
                       index: Int,
                       delegate: surveySelectionDelegate) -> SurveyViewController? {
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
}

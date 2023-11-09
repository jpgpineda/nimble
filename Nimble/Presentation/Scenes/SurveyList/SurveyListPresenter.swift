//
//  SurveyListPresenter.swift
//  Nimble
//
//  Created by javier pineda on 08/11/23.
//

import UIKit

protocol SurveyListView {
    func showFailure(message: String)
    func updateData(with surveys: [SurveyDTO])
}

protocol SurveyListPresenter {
    var view: SurveyListView { get set }
    var router: SurveyListRouter { get set }
    var useCase: SurveyUseCase { get set }
    func fetchSurveys()
    func presentMenu()
    func presentSurveyDetail()
}

class SurveyListPresenterImplementation: SurveyListPresenter {
    internal var view: SurveyListView
    internal var router: SurveyListRouter
    internal var useCase: SurveyUseCase
    
    init(view: SurveyListView,
         router: SurveyListRouter,
         useCase: SurveyUseCase) {
        self.view = view
        self.router = router
        self.useCase = useCase
    }
    
    func fetchSurveys() {
        let parameters = FetchSurveysRequest(pageNumber: .one, pageSize: .ten)
        router.showLoaderView()
        Task.init {
            do {
                let response = try await useCase.fetchSurveys(parameters: parameters)
                router.dismissLoaderView()
                view.updateData(with: response.data)
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
}

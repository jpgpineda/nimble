//
//  SurveyListViewController.swift
//  Nimble
//
//  Created by javier pineda on 08/11/23.
//

import UIKit

class SurveyListViewController: UIViewController {
    //////////////////////////////////////
    // MARK: Outlets
    //////////////////////////////////////
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var surveyPageControl: UIPageControl!
    //////////////////////////////////////
    // MARK: Properties
    //////////////////////////////////////
    private let configurator =  SurveyListConfiguratorImplementation()
    var presenter: SurveyListPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        presenter.fetchSurveys()
        setupView()
    }
    
    private func setupView() {
        todayDateLabel.text = CVDateFormatter.shortDate(Date())
    }
    
    @IBAction func presentProfile(_ sender: UIButton) {
        
    }
}

extension SurveyListViewController: SurveyListView {
    func showFailure(message: String) {
        showErrorAlert(message: message)
    }
    
    func updateData(with surveys: [SurveyDTO]) {
        print(surveys)
    }
}

//
//  SurveyDetailViewController.swift
//  Nimble
//
//  Created by javier pineda on 10/11/23.
//

import UIKit

class SurveyDetailViewController: UIViewController {
    //////////////////////////////////////
    // MARK: Outlets
    //////////////////////////////////////
    @IBOutlet weak var surveyTitleLabel: UILabel!
    @IBOutlet weak var surveyDescriptionLabel: UILabel!
    @IBOutlet weak var beginSurveyTitle: UIButton!
    @IBOutlet weak var coverImageView: UIImageView!
    
    //////////////////////////////////////
    // MARK: Properties
    //////////////////////////////////////
    private let configurator =  SurveyDetailConfiguratorImplementation()
    var presenter: SurveyDetailPresenter!
    var survey: SurveyDTO?

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        setupView()
    }
    
    private func setupView() {
        beginSurveyTitle.roundCorners(.allCorners, radius: .eight)
        guard let survey = survey else { return }
        surveyDescriptionLabel.text = survey.attributes.description
        surveyTitleLabel.text = survey.attributes.title
        guard let imageUrl = URL(string: survey.attributes.coverImageUrl) else {
            coverImageView.image = .hiking
            return }
        coverImageView.downloaded(from: imageUrl)
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
        presenter.dismissView()
    }

    @IBAction func beginSurvey(_ sender: Any) {
    }
}

extension SurveyDetailViewController: SurveyDetailView {
    
}

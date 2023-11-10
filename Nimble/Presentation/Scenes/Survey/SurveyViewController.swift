//
//  SurveyViewController.swift
//  Nimble
//
//  Created by javier pineda on 09/11/23.
//

import UIKit

class SurveyViewController: UIViewController {
    //////////////////////////////////////
    // MARK: Outlets
    //////////////////////////////////////
    @IBOutlet weak var surveyTitleLabel: UILabel!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var surveyDescriptionLabel: UILabel!
    //////////////////////////////////////
    // MARK: Properties
    //////////////////////////////////////
    var survey: SurveyDTO?
    var index: Int?
    weak var delegate: surveySelectionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        detailButton.roundCorners(.allCorners, radius: detailButton.frame.size.width / .two)
        guard let survey = survey else { return }
        surveyTitleLabel.text = survey.attributes.title
        surveyDescriptionLabel.text = survey.attributes.description
        guard let imageUrl = URL(string: survey.attributes.coverImageUrl) else { return }
        coverImageView.downloaded(from: imageUrl)
    }
    
    @IBAction func goToSurveyDetatil(_ sender: UIButton) {
        delegate?.goToSurveyDetail(surveyId: survey?.id ?? .empty)
    }
}

protocol surveySelectionDelegate: AnyObject {
    func goToSurveyDetail(surveyId: String)
}

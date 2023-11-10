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
    @IBOutlet weak var surveyContainerView: UIView!
    @IBOutlet weak var surveyPageControl: UIPageControl!
    //////////////////////////////////////
    // MARK: Properties
    //////////////////////////////////////
    private let configurator =  SurveyListConfiguratorImplementation()
    var presenter: SurveyListPresenter!
    var surveys: [SurveyDTO] = [SurveyDTO]()
    var currentViewControllerIndex: Int = .zero

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        presenter.fetchSurveys()
        setupView()
    }
    
    private func setupView() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        todayDateLabel.text = CVDateFormatter.shortDate(Date())
    }
    
    private func setupPageViewController() {
        guard let surveyPageViewController = presenter.getSurveyPageViewController() else { return }
        addChild(surveyPageViewController)
        surveyPageViewController.didMove(toParent: self)
        surveyPageViewController.dataSource = self
        surveyPageViewController.delegate = self
        surveyContainerView.addSubview(surveyPageViewController.view)
        let views: [String: UIView] = ["pageView": surveyPageViewController.view]
        surveyContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|",
                                                                          options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                          metrics: nil,
                                                                          views: views))
        surveyContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|",
                                                                          options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                          metrics: nil,
                                                                          views: views))
        guard let startingViewController = getSurveyViewController(index: currentViewControllerIndex) else { return }
        surveyPageViewController.setViewControllers([startingViewController],
                                                    direction: .forward,
                                                    animated: true)
    }
    
    private func getSurveyViewController(index: Int) -> SurveyViewController? {
        if index >= surveys.count || surveys.isEmpty {
            return nil
        }
        guard let surveyViewController = presenter.getSurveyView(surveys[index],
                                                                 index: index,
                                                                 delegate: self) else { return nil }
        return surveyViewController
    }
    
    @IBAction func presentProfile(_ sender: UIButton) {
        
    }
}

extension SurveyListViewController: SurveyListView {
    func showFailure(message: String) {
        showErrorAlert(message: message)
    }
    
    func updateData(with surveys: [SurveyDTO]) {
        self.surveys = surveys
        setupPageViewController()
        print(surveys)
    }
}

extension SurveyListViewController: surveySelectionDelegate {
    func goToSurveyDetail(surveyId: String) {
        presenter.presentSurveyDetail()
    }
}

extension SurveyListViewController: UIPageViewControllerDataSource {
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentViewControllerIndex
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return surveys.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let surveyViewController = viewController as? SurveyViewController
        guard var currenIndex = surveyViewController?.index else {
            return nil
        }
        currentViewControllerIndex = currenIndex
        
        if currenIndex == .zero {
            return nil
        }
        
        currenIndex -= .one
        
        return getSurveyViewController(index: currenIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let surveyViewController = viewController as? SurveyViewController
        
        guard var currentIndex = surveyViewController?.index else { return nil }
        if currentIndex >= surveys.count {
            return nil
        }
        currentIndex += .one
        currentViewControllerIndex = currentIndex
        return getSurveyViewController(index: currentIndex)
    }
}

extension SurveyListViewController: UIPageViewControllerDelegate {
    
}

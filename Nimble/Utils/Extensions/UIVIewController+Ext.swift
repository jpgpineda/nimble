//
//  UIVIewController+Ext.swift
//  Nimble
//
//  Created by javier pineda on 07/11/23.
//

import UIKit
import NotificationBannerSwift

extension UIViewController {
    
    func popView() {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func showLoader() {
        guard let viewController = ModuleManager.toolsDependency.makeLoaderViewController() else { return }
        addChild(viewController)
        guard let loaderView = viewController.view else { return }
        loaderView.tag = 100
        view.addSubview(loaderView)
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
    
    func dismissLoader() {
        DispatchQueue.main.async {
            guard let loaderView = self.view.viewWithTag(100) else { return }
            loaderView.removeFromSuperview()
        }
    }
    
    func showErrorAlert(message: String) {
        let errorBanner = NotificationBanner(title: .Localized.ups,
                                             subtitle: message,
                                             style: .danger)
        DispatchQueue.main.async {
            errorBanner.show()
        }
    }
    
    func showSuccessAlert(message: String) {
        let successBanner = NotificationBanner(title: .Localized.congratsTitle,
                                               subtitle: message,
                                               style: .success)
        DispatchQueue.main.async {
            successBanner.show()
        }
    }
}

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
    
    func showConfimation(title: String,
                         message: String,
                         cancel: String?,
                         confirm: String,
                         cancelAction: @escaping() -> Void,
                         confirmAction:  @escaping() -> Void) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .actionSheet)
        
        if let cancel = cancel {
            alert.addAction(UIAlertAction(title: confirm,
                                          style: .cancel,
                                          handler: { (action) in
                                            cancelAction()
            }))
        }
        
        alert.addAction(UIAlertAction(title: confirm,
                                      style: .default,
                                      handler: { (action) in
                                        confirmAction()
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func manageTokenExpiration(time: Int64,
                               signOut: @escaping() -> Void,
                               renewSessionAction: @escaping() -> Void) {
        let timer = Timer(timeInterval: TimeInterval(integerLiteral: time),
                          repeats: false) { _ in
            self.showConfimation(title: .Localized.tokenSoonToExpire,
                                 message: .Localized.renewSession,
                                 cancel: .Localized.signOut,
                                 confirm: .Localized.continueTitle) {
                signOut()
            } confirmAction: {
                renewSessionAction()
            }
        }
    }
    
    func presentNewFlow(rootView: UIViewController) {
        DispatchQueue.main.async {
            let navigationController = UINavigationController(rootViewController: rootView)
            navigationController.setupPresentation()
            self.present(navigationController, animated: true)
        }
    }
}

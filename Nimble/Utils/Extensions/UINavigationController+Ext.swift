//
//  UINavigationController+Ext.swift
//  Nimble
//
//  Created by javier pineda on 08/11/23.
//

import UIKit

extension UINavigationController {
    func setupPresentation() {
        modalTransitionStyle = .coverVertical
        modalPresentationStyle = .fullScreen
    }
}

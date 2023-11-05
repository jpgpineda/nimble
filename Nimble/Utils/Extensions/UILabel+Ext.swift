//
//  UILabel+Ext.swift
//  Nimble
//
//  Created by javier pineda on 05/11/23.
//

import UIKit

extension UILabel {
    @IBInspectable var localized: String {
        set {
            text = .Localized.getLocalizedString(newValue)
        }
        get {
            return text ?? .empty
        }
    }
}

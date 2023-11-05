//
//  UITextfield+Ext.swift
//  Nimble
//
//  Created by javier pineda on 05/11/23.
//

import UIKit

extension UITextField {
    @IBInspectable var hintLocalized: String {
        set {
            placeholder = .Localized.getLocalizedString(newValue)
        }
        get {
            return placeholder ?? .empty
        }
    }
    
    func setState(isError: Bool) {
        setUpMargins(color: isError ? .red : .secondaryLabel)
    }
}

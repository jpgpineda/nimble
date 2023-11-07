//
//  NimbleTextField.swift
//  Nimble
//
//  Created by javier pineda on 04/11/23.
//

import UIKit

class NimbleTextField: UITextField {
    override func awakeFromNib() {
        roundCorners([.bottomLeft, .bottomRight, .topLeft], radius: .eight)
    }
    
    @IBInspectable var isPassword: Bool = false {
        didSet {
            if isPassword {
                isSecureTextEntry = true
                setupPasswordView()
            }
        }
    }
    
    private func setupPasswordView() {
        rightViewMode = UITextField.ViewMode.always
        var forgotPasswordButton = UIButton(type: .system)
        forgotPasswordButton.setTitle(.Localized.forgot, for: .normal)
        forgotPasswordButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.showRecoverPasswordScreen)))
        rightView = forgotPasswordButton
    }
    
    @objc private func showRecoverPasswordScreen() {

    }
    
    func setState(isError: Bool) {
        setUpMargins(color: isError ? .red : .secondaryLabel)
    }
}

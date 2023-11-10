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
        backgroundColor = .darkGray.withAlphaComponent(.alpha)
        attributedPlaceholder = NSAttributedString(
            string: hintLocalized,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(.alpha)])
        tintColor = .white
        textColor = .white
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
        forgotPasswordButton.tintColor = .white.withAlphaComponent(.alpha)
        forgotPasswordButton.setTitle(.Localized.forgot, for: .normal)
        forgotPasswordButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.showRecoverPasswordScreen)))
        rightView = forgotPasswordButton
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x += -8
        return textRect
    }
    
    @objc private func showRecoverPasswordScreen() {

    }
    
    func clearData() {
        DispatchQueue.main.async {
            self.text = .empty
        }
    }
}

//
//  LoginViewController.swift
//  Nimble
//
//  Created by javier pineda on 05/11/23.
//

import UIKit

class LoginViewController: UIViewController {
    //////////////////////////////////////
    // MARK: Outlets
    //////////////////////////////////////
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: NimbleButton!
    @IBOutlet weak var passwordTextField: UITextField!
    //////////////////////////////////////
    // MARK: Properties
    //////////////////////////////////////
    private let configurator =  LoginConfiguratorImplementation()
    var presenter: LoginPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        setupView()
    }
    
    private func setupView() {
        containerView.hideKeyboardWhenTappedAround()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func requestLogin(_ sender: NimbleButton) {
    }
    
    @IBAction func presentSignUp(_ sender: UIButton) {
        presenter.presentSignUp()
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
        presenter.dismissView()
    }
    
    private func validateData() {
        loginButton.isActive = presenter.validateField()
    }
}

extension LoginViewController: LoginView {
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if textField == emailTextField {
            if text.isEmpty {
                textField.setState(isError: true)
                presenter.email = .empty
            } else {
                textField.setState(isError: false)
            }
            presenter.email = text
        } else {
            if text.isEmpty {
                textField.setState(isError: true)
                presenter.password = .empty
            } else {
                textField.setState(isError: false)
            }
            presenter.password = text
        }
        validateData()
    }
}

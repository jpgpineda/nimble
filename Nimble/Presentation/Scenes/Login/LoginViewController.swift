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
        emailTextField.text = presenter.getLastSignedUser()
        presenter.email = presenter.getLastSignedUser()
    }
    
    @IBAction func requestLogin(_ sender: NimbleButton) {
        presenter.requestLogin()
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
    func sheduleTokenExpiration(duration: Int64) {
        manageTokenExpiration(time: duration) {
            print("Call to sign out API")
        } renewSessionAction: {
            print("Call to renew API")
        }
    }
    
    func showSuccess(message: String) {
        showSuccessAlert(message: message)
    }
    
    func showFailure(message: String) {
        showErrorAlert(message: message)
    }
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

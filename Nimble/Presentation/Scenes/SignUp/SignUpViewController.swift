//
//  SignUpViewController.swift
//  Nimble
//
//  Created by javier pineda on 06/11/23.
//

import UIKit

class SignUpViewController: UIViewController {
    //////////////////////////////////////
    // MARK: Outlets
    //////////////////////////////////////
    @IBOutlet weak var nameTextField: NimbleTextField!
    @IBOutlet weak var emailTextField: NimbleTextField!
    @IBOutlet weak var passwordTextField: NimbleTextField!
    @IBOutlet weak var confirmPasswordTextField: NimbleTextField!
    @IBOutlet weak var signUpButton: NimbleButton!
    @IBOutlet weak var containerView: UIView!
    //////////////////////////////////////
    // MARK: Properties
    //////////////////////////////////////
    private let configurator =  SignUpConfiguratorImplementation()
    var presenter: SignUpPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        setupView()
    }
    
    private func setupView() {
        containerView.hideKeyboardWhenTappedAround()
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    @IBAction func backToLogin(_ sender: UIButton) {
        presenter.dismissView()
    }
    
    @IBAction func requestSignUp(_ sender: NimbleButton) {
        
    }
    
    private func validateData() {
        signUpButton.isActive = presenter.validateFields()
    }
}

extension SignUpViewController: SignUpView {
    
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        textField.setState(isError: text.isEmpty)
        switch textField {
        case nameTextField:
            presenter.name = text
        case emailTextField:
            presenter.email = text
        case passwordTextField:
            presenter.password = text
        case confirmPasswordTextField:
            presenter.confirmPassword = text
        default:
            break
        }
        validateData()
    }
}

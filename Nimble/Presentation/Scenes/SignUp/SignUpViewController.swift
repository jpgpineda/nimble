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
    @IBOutlet weak var nameTExtField: UITextField!
    
    @IBOutlet weak var signUpButton: NimbleButton!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    //////////////////////////////////////
    // MARK: Properties
    //////////////////////////////////////
    private let configurator =  SignUpConfiguratorImplementation()
    var presenter: SignUpPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
    }
    
    @IBAction func backToLogin(_ sender: UIButton) {
        presenter.dismissView()
    }
    
    @IBAction func requestSignUp(_ sender: NimbleButton) {
        
    }
}

extension SignUpViewController: SignUpView {
    
}

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
    }
    
    @IBAction func requestLogin(_ sender: NimbleButton) {
    }
    
    @IBAction func presentSignUp(_ sender: UIButton) {
    }
}

extension LoginViewController: LoginView {
    
}

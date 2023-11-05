//
//  WelcomeViewController.swift
//  Nimble
//
//  Created by javier pineda on 04/11/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    ///////////////////////////////////////
    // MARK: Outlets
    ///////////////////////////////////////
    
    ///////////////////////////////////////
    // MARK: Properties
    ///////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func presentLogin(_ sender: NimbleButton) {
        
    }
}

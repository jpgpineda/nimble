//
//  DrawerMenuViewController.swift
//  Nimble
//
//  Created by javier pineda on 10/11/23.
//

import UIKit

class DrawerMenuViewController: UIViewController {
    //////////////////////////////////////
    // MARK: Outlets
    //////////////////////////////////////

    @IBOutlet weak var userAvatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    //////////////////////////////////////
    // MARK: Properties
    //////////////////////////////////////
    private let configurator =  DrawerMenuConfiguratorImplementation()
    var presenter: DrawerMenuPresenter!
    var transitionManager: DrawerTransitionManager?
    var user: UserDTO?
    weak var delegate: SignOutDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(self)
        setupView()
    }
    
    private func setupView() {
        guard let user = user else { return }
        userNameLabel.text = user.name
        guard let url = URL(string: user.avatarUrl) else { return }
        userAvatarImage.downloaded(from: url, contentMode: .scaleToFill)
    }
    
    @IBAction func logout(_ sender: UIButton) {
        delegate?.signOut()
        presenter.dismissView()
    }
}

extension DrawerMenuViewController: DrawerMenuView {
    
}

protocol SignOutDelegate: AnyObject {
    func signOut()
}

//
//  LoaderViewController.swift
//  Nimble
//
//  Created by javier pineda on 07/11/23.
//

import UIKit
import Lottie

class LoaderViewController: UIViewController {
    //////////////////////////////////////
    // MARK: Outlets
    //////////////////////////////////////
    @IBOutlet weak var animationView: LottieAnimationView!
    //////////////////////////////////////
    // MARK: Properties
    //////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.loopMode = .loop
        animationView.play()
    }
}

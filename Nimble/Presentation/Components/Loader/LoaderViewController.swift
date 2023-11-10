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
    @IBOutlet weak var animationView: UIView!
    //////////////////////////////////////
    // MARK: Properties
    //////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        let lottieAnimation: LottieAnimationView = .init(name: "loader")
        lottieAnimation.frame = animationView.bounds
        lottieAnimation.contentMode = .scaleAspectFit
        lottieAnimation.loopMode = .loop
        animationView.addSubview(lottieAnimation)
        lottieAnimation.play()
    }
}

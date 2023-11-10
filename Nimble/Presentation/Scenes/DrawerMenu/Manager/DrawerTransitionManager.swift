//
//  DrawerTransitionManager.swift
//  GBMChallengue
//
//  Created by javier pineda on 16/10/23.
//

import UIKit

class DrawerTransitionManager: NSObject, UIViewControllerTransitioningDelegate {
    let slideAnimation = DrawerSlideAnimation()
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DrawerPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        slideAnimation.isPresenting = true
        return slideAnimation
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        slideAnimation.isPresenting = false
        return slideAnimation   
    }
}
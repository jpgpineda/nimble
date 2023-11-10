//
//  ToolsDependency.swift
//  Nimble
//
//  Created by javier pineda on 07/11/23.
//

import Swinject

protocol ToolsDependency {
    var container: Container { get set }
    func makeLoaderViewController() -> LoaderViewController?
    func makeMenuViewController(user: UserDTO,
                                delegate: SignOutDelegate,
                                drawerDelegate: DrawerTransitionManager) -> DrawerMenuViewController?
}

class ToolsDependencyImplementation: ToolsDependency {
    internal var container: Container
    
    init(container: Container) {
        self.container = container
        registerLoaderViewController()
        registerDrawerMenuViewController()
    }
    
    private func registerLoaderViewController() {
        container.register(LoaderViewController.self) { _ in
            return LoaderViewController()
        }
    }
    
    func makeLoaderViewController() -> LoaderViewController? {
        return container.resolve(LoaderViewController.self)
    }
    
    private func registerDrawerMenuViewController() {
        container.register(DrawerMenuViewController.self) { _ in
            return DrawerMenuViewController()
        }
    }
    
    func makeMenuViewController(user: UserDTO,
                                delegate: SignOutDelegate,
                                drawerDelegate: DrawerTransitionManager) -> DrawerMenuViewController? {
        guard let viewController = container.resolve(DrawerMenuViewController.self) else { return nil }
        viewController.transitionManager = drawerDelegate
        viewController.transitioningDelegate = drawerDelegate
        viewController.modalPresentationStyle = .custom
        viewController.user = user
        viewController.delegate = delegate
        return viewController
    }
}

//
//  ModuleManager.swift
//  Nimble
//
//  Created by javier pineda on 05/11/23.
//

import Swinject

class ModuleManager {
    var container = Container()
    static var accessDependency: AccessDependency!
    
    func configure() {
        ModuleManager.accessDependency = AccessDependencyImplementation(container: container)
    }
}

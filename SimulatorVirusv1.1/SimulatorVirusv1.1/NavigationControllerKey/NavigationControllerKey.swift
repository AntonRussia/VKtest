//
//  NavigationControllerKey.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 07.05.2023.
//

import  SwiftUI


struct NavigationControllerKey:EnvironmentKey {
    static let defaultValue: UINavigationController? = nil
}

extension EnvironmentValues {
    
    var navigationController: NavigationControllerKey.Value{
        get{self[NavigationControllerKey.self]}
        set {self[NavigationControllerKey.self] = newValue}
    }
}

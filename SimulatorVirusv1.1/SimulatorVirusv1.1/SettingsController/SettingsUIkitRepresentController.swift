//
//  SettingsSwUIRepresentController.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 07.05.2023.
//

import Foundation
import SwiftUI


struct SettingsUIkitRepresentController:UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> NavigationController {
       
        let settingsUIKitController = SettingsUIKitController()
        let settingsUIKitNavigationController:NavigationController
        = .init(rootViewController: settingsUIKitController)
        
        return settingsUIKitNavigationController
    }
    
    func updateUIViewController(_ uiViewController: NavigationController, context: Context) {
         
    }
    
    typealias UIViewControllerType = NavigationController
    
    
}


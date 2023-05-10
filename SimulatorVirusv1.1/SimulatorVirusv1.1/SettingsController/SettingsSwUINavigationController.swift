//
//  SettingsSwUINavigationController.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 07.05.2023.
//

import SwiftUI

struct SettingsSwUINavigationController:UIViewControllerRepresentable {
    
    typealias UIViewControllerType = NavigationController
    
    func makeUIViewController(context: Context) -> NavigationController {
        
        let settingsNav: NavigationController
        let emptyView: UIViewController  = UIHostingController(rootView: EmptyView())
        settingsNav = NavigationController(rootViewController: emptyView)
        
        
        let settingsSwUIScreen = SettingsSwiftUIView()
            .environment(\.navigationController, settingsNav)
        
        let setttingsSwUIHostingController = UIHostingController(rootView: settingsSwUIScreen)
        
        settingsNav.addChild(setttingsSwUIHostingController)
        settingsNav.setNavigationBarHidden(true, animated: false)
       // let settingsNavigationController = NavigationControllerExclusive(rootViewController: setttingsSwUIHostingController)
        return settingsNav
    }
    
    func updateUIViewController(_ uiViewController: NavigationController, context: Context) {
         
    }
    
   
    
    
}

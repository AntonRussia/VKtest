//
//  SimulationSwUINavigationController.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 07.05.2023.
//

import SwiftUI

struct SimulationSwUINavigationController:UIViewControllerRepresentable{

    typealias UIViewControllerType = NavigationController
    
    func makeUIViewController(context: Context) -> NavigationController {
        let simulationNav: NavigationController
        let emptyView:UIViewController = UIHostingController(rootView: EmptyView())
        simulationNav = NavigationController(rootViewController: emptyView)
        
        
        let simulationSwiftUIView = SimulatorSwiftUIView()
        let simulationSwUIHostingController = UIHostingController(rootView: simulationSwiftUIView)
        
        simulationNav.addChild(simulationSwUIHostingController)
        
        let simulationNavigationController = NavigationController(rootViewController: simulationSwUIHostingController)
        return simulationNavigationController
    }
    
    func updateUIViewController(_ uiViewController: NavigationController, context: Context) {
         
    }
    
    
}

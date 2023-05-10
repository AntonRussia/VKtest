//
//  SimulatorUIkitRepresentController.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 08.05.2023.
//

import SwiftUI




struct SimulatorUIkitRepresentController:UIViewControllerRepresentable {
    
    
    typealias UIViewControllerType = NavigationController
    
    
    func makeUIViewController(context: Context) -> NavigationController {
         
        let simulatorController = SimulatorUIKitController()
        let naviController = NavigationController(rootViewController: simulatorController)
        
         return naviController
    }
    
    func updateUIViewController(_ uiViewController: NavigationController, context: Context) {
       
    }
    
    
    
    
}

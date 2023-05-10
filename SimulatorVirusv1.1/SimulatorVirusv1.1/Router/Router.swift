//
//  Router.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 07.05.2023.
//

import UIKit
import SwiftUI

 


enum Route {
    case Settings
    case Simulator
}




final class Router  {
    
   
    
    static let injected = Router()
    private init(){}
    
    private var appNavigationController: UINavigationController? {
        UIApplication.shared.topViewController()?.navigationController
    }
    
    private var naviController:UINavigationController?
    
    func route(to direction:Route, fromController:UINavigationController? = nil){
         
        let controller = fromController == nil ? appNavigationController:fromController
        guard let navigationController = fromController ?? controller else {return}
        naviController = navigationController
        switch direction {
        case .Settings:push(to: ScreenFactory.settingsScreen(), from: navigationController)
        case .Simulator:push(to: ScreenFactory.simulatorScreen(), from: navigationController)
        }
    }
    
    private func push(to:UIViewController, from:UINavigationController?){
        DispatchQueue.main.async {
            from?.pushViewController(to, animated: true)
        }
    }
    
    func back(){
        if naviController != nil {
            naviController?.popViewController(animated: true)
            return
        }
        appNavigationController?.popViewController(animated: true)
    }
}

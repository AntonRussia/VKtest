//
//  UIAplication + TopViewController.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 07.05.2023.
//

import UIKit
import SwiftUI

extension UIApplication {
    func topViewController() -> UIViewController? {
        var topViewController:UIViewController? = nil
       
         
        if #available(iOS 13, *) {
            
     
           for scene in connectedScenes {
                if let windowScene = scene as? UIWindowScene {
                    if let window = windowScene.windows.first(where: {$0.isKeyWindow}){
                        // for window in windowScene.windows {
                        //   if window.isKeyWindow {
                        topViewController = window.rootViewController
                        //   }
                    }
                }
            }
        } else {
            topViewController = keyWindow?.rootViewController
        }
     
        while true {
            if let presented = topViewController?.presentedViewController {
                topViewController = presented
            }
            
            if let navController = topViewController as? UINavigationController {
                topViewController = navController.topViewController
            }
           
            if let tabBarController = topViewController as? UITabBarController {
                topViewController = tabBarController.selectedViewController
            }
            break
        }
        return  topViewController
    }
}

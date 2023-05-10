//
//  ScreenFactory.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 08.05.2023.
//

import SwiftUI
import UIKit
class ScreenFactory {
    
    static func settingsScreen() ->UIViewController {
        UIHostingController(rootView: SettingsSwiftUIView())
    }
    
    static func simulatorScreen()->UIViewController{
        UIHostingController(rootView: SimulatorSwiftUIView())
    }
}

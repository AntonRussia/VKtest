//
//  Store.swift
//  VirusSimulator
//
//  Created by Mac on 06.05.2023.
//

import Foundation
import SwiftUI

class Store:ObservableObject{
    @Published  var appState:SettingsState

    var reducer:Reducer
    
    init(appState: SettingsState, reducer: Reducer) {
        self.appState = appState
        self.reducer = reducer
    }
    
    func dispatch(_ action:Action){
        reducer.update(&appState, action)
    }
    
}

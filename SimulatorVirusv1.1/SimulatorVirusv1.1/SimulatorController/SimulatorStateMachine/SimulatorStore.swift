//
//  SimulatorStore.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 08.05.2023.
//

import Foundation
import SwiftUI
 import SpriteKit

class SimulatorStore:ObservableObject {
    
    @Published var state:SimulatorState
    var reducer:SimulatorReducer
    
    init(state: SimulatorState, reducer: SimulatorReducer) {
        self.state = state
        self.reducer = reducer
    }
    
    func update(_ action:SimulatorAction)->SKAction? {
        reducer.update(&state, action)
    }
    
    
}

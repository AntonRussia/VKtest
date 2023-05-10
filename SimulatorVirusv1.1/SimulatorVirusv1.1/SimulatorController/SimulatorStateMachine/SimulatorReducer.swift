//
//  SimulatorReducer.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 08.05.2023.
//

import Foundation
import SpriteKit

indirect enum SimulatorAction {
    case sick(HumanModel)
    case infected(healthHuman:HumanModel,sickHuman:HumanModel)
    case add(Int)
}

class SimulatorReducer {
    
    private let _cgPointService = CGPointService.injected
    private var  impulse: CGVector {_cgPointService.randomVector(0.3)}
    
    func update(_ state:inout SimulatorState,_ action:SimulatorAction) -> SKAction? {
        
        switch action {
            
        case let .add(count): state.healthCount  = count
            return nil
            
        case let .sick(human):
            
            state.infected()
            return SickStateConstructior(impulse: impulse, human:human).action
            
        case let .infected(healthHuman: manHealth, sickHuman: sickMan):
            
            let action = InfectionStateConstructior(healthHuman: manHealth,sickHuman: sickMan,impulse:impulse).action
            if (action != nil){ state.infected() }
            
            return action
        }
        
 
    }

}

 

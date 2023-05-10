//
//  SimulatorState.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 08.05.2023.
//

import Foundation


struct SimulatorState {
    
    var sickCount:Int = 0
    var healthCount:Int = 0
    var limitCount:Int = 0
    
    mutating func infected(){
        if (sickCount < limitCount)  {
            sickCount += 1
            healthCount =  healthCount  - 1
        }
    }
}

 

extension SimulatorState {
    func task(){
        
    }
}

//
//  AppState.swift
//  VirusSimulator
//
//  Created by Mac on 06.05.2023.
//

import Foundation


struct SettingsState {
    
    var isStartSimulator = false
    var nextActionForInfectionFactory:Action = .increment(.infectionFactory)
    
    var groupSize:Int = 0
    var infectionFactory:Int = 0
    var refreshFactoryForAll = false
    
    var isNotMaxInfectoryCount:Bool{
      
      return  infectionFactory < 4
        
    }
    
    var isNotMaxPopulation:Bool {
     
      return  groupSize < 100
    
    }
    
    var isNotMinPopulation: Bool {
        groupSize > 0
    }
    
    var isNotMinInfectionFactory:Bool{
        infectionFactory > 0
    }
}

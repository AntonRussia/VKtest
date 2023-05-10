//
//  HumanModel.swift
//  VirusSimulator
//
//  Created by Mac on 06.05.2023.
//

import Foundation
import SpriteKit

class HumanModel:SKSpriteNode,Sendable{
 
    
    var infectionCount:Int = 0
    
    var infectionCountCache:Int = 0
     
    
    var nick:String? {
        name
    }
    
   
    
    var isHealth:Bool {
        name == InfectionStatus.health.title
    }
    
    func decrimentInfectionFactory(){
        if infectionCount > 0 {
          infectionCount =  infectionCount - 1
        }
    }
    
}

//
//  ActionConstructor.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 08.05.2023.
//

import Foundation
import UIKit
import SpriteKit

struct SickStateConstructior {
    
    var action:SKAction? = nil
    
    init(impulse:CGVector,human:HumanModel) {
        self.action = SickStateConstructior.perform(impulse: impulse, human: human)
    }
    
   
    
    static func perform(color:UIColor = .red,status:InfectionStatus = .sick,impulse:CGVector,human:HumanModel)->SKAction?{
     
       if human.name == InfectionStatus.health.title {
           let action = SKAction.run({
                human.name = status.title
                human.color = color
                human.physicsBody?.applyImpulse(impulse)
            })
            return action
        }
        return nil
   
    }
    
   
}


struct InfectionStateConstructior {
    
    var action:SKAction? = nil
    
   
    
     init(healthHuman:HumanModel,sickHuman:HumanModel, impulse:CGVector){
        self.action = InfectionStateConstructior.infectionLogic(healthHuman: healthHuman, sickHuman: sickHuman, impulse: impulse)
    }
    

    
    static func infectionLogic(healthHuman:HumanModel,sickHuman:HumanModel, impulse:CGVector)->SKAction?{
         
        if healthHuman.isHealth == true && sickHuman.isHealth == false, sickHuman.infectionCount > 0{
            sickHuman.decrimentInfectionFactory()
            return SickStateConstructior.perform(impulse: impulse, human: healthHuman)
        }
        
        if healthHuman.isHealth == false && sickHuman.isHealth == true , healthHuman.infectionCount > 0{
            healthHuman.decrimentInfectionFactory()
            return SickStateConstructior.perform(impulse: impulse, human: sickHuman)
        }
        return nil
    }
}

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
           return infectedActionFactory(healthHuman: healthHuman, sickHuman: sickHuman,impulse:impulse)
            /*
            let actionSick = SKAction.run {
                sickHuman.decrimentInfectionFactory()
            }
            guard let actionInfected = SickStateConstructior.perform(impulse: impulse, human: healthHuman)
            else {return nil}
            
            return SKAction.sequence([actionSick, actionInfected])
            */
        }
        
        if healthHuman.isHealth == false && sickHuman.isHealth == true , healthHuman.infectionCount > 0{
         return   infectedActionFactory(healthHuman: sickHuman, sickHuman: healthHuman,impulse:impulse)
          //  healthHuman.decrimentInfectionFactory()
            /*
            let actionSick = SKAction.run {
                healthHuman.decrimentInfectionFactory()
            }
            guard let actionInfected = SickStateConstructior.perform(impulse: impulse, human: sickHuman)
            else {return nil}
            
            return SKAction.sequence([actionSick, actionInfected])
            */
            //return SickStateConstructior.perform(impulse: impulse, human: sickHuman)
        }
        return nil
    }
    
    static func infectedActionFactory(healthHuman:HumanModel,sickHuman:HumanModel,impulse:CGVector)->SKAction? {
        let actionSick = SKAction.run {
            sickHuman.decrimentInfectionFactory()
        }
        guard let actionInfected = SickStateConstructior.perform(impulse: impulse, human: healthHuman)
        else {return nil}
        
        return SKAction.sequence([actionSick, actionInfected])
    }
}

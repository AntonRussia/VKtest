//
//  SimunationViewModel.swift
//  VirusSimulator
//
//  Created by Mac on 06.05.2023.
//
import Combine
import Foundation
import SpriteKit
import SwiftUI


 

final class SimulationViewModel:ObservableObject {
    
    private let cgPointService = CGPointService.injected
    private let populationService = CreatorPopulationService.instance
    private let routerEventService =  RouterEventService.shared
   
    var cancallbles = Set<AnyCancellable>()
  
    
    init(){}

 //LoadAsync if need if limit human 1000 or more
    /*func viewDidLoad(comlict: @Sendable @escaping(HumanModel) async ->Void,countHuman:@escaping(Int)-> Void){
        populationService.$humans
            .sink(receiveValue:{[weak self]humans in
                
                guard let self = self else {return}
                Task{
                    for human in humans {
                      await comlict(human)
                        await MainActor.run(body: {
                            human.physicsBody?.applyImpulse(self.cgPointService.randomVector(0.5))
                        })
                    }
                    countHuman(humans.count)
                }
            })
            .store(in: &cancallbles)
    }*/
    
    func viewDidLoad(comlict:@escaping(HumanModel) ->Void,countHuman:@escaping(Int)-> Void){
        populationService.$humans
            .sink(receiveValue:{[weak self]humans in
                guard let self = self else {return}
                    for human in humans {
                     comlict(human)
                        human.physicsBody?.applyImpulse(self.cgPointService.randomVector(0.5))
                    }
                    countHuman(humans.count)
            })
            .store(in: &cancallbles)
    }
    
 
  
    
    func sendState(_ state:SimulatorState?){
        guard let state = state else  {return}
        let stateForTask = SimulatorState(sickCount: state.sickCount,healthCount: state.healthCount)
        self.routerEventService.sendState(stateForTask)
    }
 
}

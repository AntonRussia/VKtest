//
//  Reducer.swift
//  VirusSimulator
//
//  Created by Mac on 06.05.2023.
//

import Foundation

enum Action {
    case increment(Event)
    case decriment(Event)
}

enum Event {
    case groupSize
    case infectionFactory
    case refresh
    case changeForAll
    case groupRemove(Int)
    case addToGroup(Int)
    case removeAll
}

final class Reducer{
    
    private let populationService = CreatorPopulationService.instance
   
    
    func update(_ appState:inout SettingsState, _ action:Action) {
        let infectionFactory = appState.infectionFactory
        switch action{
        case let .increment(event):
            switch event {
            case let .addToGroup(count):
                appState.groupSize =  appState.groupSize +  count
                populationService.addCount(count, infectedFactory: infectionFactory)
                
                
            case .changeForAll: appState.refreshFactoryForAll = true
            case .refresh: populationService.reload(infectionFactory: infectionFactory)
            case.groupSize:
                
                if (appState.isNotMaxPopulation ){
                appState.groupSize =  appState.groupSize +  1
                populationService.createNewHuman(infectionFactory:appState.infectionFactory)
            }
            case .infectionFactory:
                if (appState.isNotMaxInfectoryCount) {
                    appState.infectionFactory += 1
                }
                if(appState.isNotMaxInfectoryCount == false){
                    appState.nextActionForInfectionFactory = .decriment(.infectionFactory)
                }
            default:break
            }
        case let .decriment(event):
            
            switch event {
            case .removeAll:
                appState.groupSize = 0
                populationService.removeAll()
                
            case let .groupRemove(count):
                appState.groupSize =  appState.groupSize - count
                populationService.removeCount(count)
            case .changeForAll: appState.refreshFactoryForAll = false
            case .groupSize: if (appState.isNotMinPopulation) {
                appState.groupSize -= 1
                populationService.removeHuman()
            }
            case .infectionFactory:
                if (appState.isNotMinInfectionFactory) {
                appState.infectionFactory -= 1
                appState.infectionFactory == 0 ? appState.nextActionForInfectionFactory = .increment(.infectionFactory): nil
          
                }
            default:break
            }
      
        }
    }
}

/*
 
 case .decriment:
     Thread {
     Task{
         await self.asyncTaskService.removeAsyncGroupTask  {
             await self.populationService.removeHumanAsync()
         }
     }
     }.start()
     
     appState.groupSize = appState.groupSize > 0 ?  appState.groupSize -  1 : 0

 }
Thread {
    Task{
        await self.asyncTaskService.createAsyncGroupTask{
                await self.populationService.createNewHuman()
        }
    }
}.start()
appState.groupSize = appState.groupSize < 100 ?  appState.groupSize +  1 : 100

*/

//
//  ViewModel.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 10.05.2023.
//

import Foundation
import Combine

class ProgressInfectedCounterView:ObservableObject {
    
    private let routerEventService = RouterEventService.shared
    
    @Published var infectedProgressState:SimulatorState?
    
    var cancellables = Set<AnyCancellable>()
    
    init(){
        
       RouterEventService.shared.publushedState.sink {[weak self] state in
            self?.infectedProgressState = state
            
        }.store(in: &cancellables)
    }

  
   
    
}

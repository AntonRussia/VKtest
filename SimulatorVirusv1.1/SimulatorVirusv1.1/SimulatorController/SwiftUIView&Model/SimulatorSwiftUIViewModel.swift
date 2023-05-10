//
//  SimulatorSwiftUIViewModel.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 09.05.2023.
//

import SwiftUI
import Combine


class SimulatorSwiftUIViewModel:ObservableObject {
    
    private let createPopulationService = CreatorPopulationService.instance
    
    func reloadPopulation(){
        createPopulationService.reload()
    }
    
}

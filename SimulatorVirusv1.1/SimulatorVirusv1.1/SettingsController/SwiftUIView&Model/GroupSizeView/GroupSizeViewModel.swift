//
//  GroupSizeViewModel.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 10.05.2023.
//

import SwiftUI
import Combine


final class GroupSizeViewModel:ObservableObject {
    @Published var humans = [HumanModel]()
    private let createService = CreatorPopulationService.instance
     var cancellables = Set<AnyCancellable>()
    
    func presentPopulation(){
        createService.$humans.sink {[weak self] humansObject in
            self?.humans = humansObject
        }.store(in: &cancellables)
    }
}

//
//  InfectectionStatus.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 08.05.2023.
//

import Foundation

enum InfectionStatus{
    case health
    case sick
    
    var title:String {
          "\(self)"
    }
}

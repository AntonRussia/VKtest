//
//  RouterEventService.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 09.05.2023.
//

import Foundation
import SwiftUI
import Combine

class RouterEventService {
    
   var publishedNotifly: AnyPublisher<Void,Never> {
         subject.eraseToAnyPublisher()
    }
    
    var publushedState:AnyPublisher<SimulatorState,Never>{
         stateSubjects
            .eraseToAnyPublisher()
    }
    
    static let shared = RouterEventService()
    
    private let subject = PassthroughSubject<Void,Never>()
    private let stateSubjects = PassthroughSubject<SimulatorState, Never>()
    
    private(set) var counter = 0 {
        didSet{
            subject.send()
        }
    }
    
    
    func backEvent(){
        if counter == 0 {
            counter += 1
        }
    }
    
    
    func sendState(_ state:SimulatorState){
       stateSubjects.send(state)
    }
    
    deinit{
        print("RouterEventService")
    }
}

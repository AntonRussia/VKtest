//
//  HumanCreatorService.swift
//  VirusSimulator
//
//  Created by Mac on 06.05.2023.
//

 
import SwiftUI
import SpriteKit

final class CreatorPopulationService:ObservableObject {
    
    @Published var humans:[HumanModel] = []
  
    
    var screenSize:CGSize{
        UIScreen.main.bounds.size
    }
    
    static var instance = CreatorPopulationService()
    private init(){}
    
    /*public func addHumanAsync(human:HumanModel) async {
        humans.append(human)
        print(humans.count)
    }
    
    public func createNewHuman() async -> HumanModel {
        makeHuman(status: .health, location: randomPosition())
       
    }
    
    public func removeHumanAsync() async{
        if humans.isEmpty {return}
        humans.removeLast()
        print(humans.count)
    }*/
    public func reload(infectionFactory:Int? = nil){
        
        humans.forEach { human in
            human.color = .green
            human.name = InfectionStatus.health.title
            if human.infectionCountCache != 0 {
                human.infectionCount = human.infectionCountCache
            }
            guard let factor = infectionFactory else {return}
            human.infectionCount = factor
            human.infectionCountCache = factor
        }
    }
    
    public func removeCount(_ count: Int){
        DispatchQueue.main.async {[weak self] in
            for _ in 1...count {
                self?.humans.removeLast()
            }
        }
    }
    
    public func removeAll(){
        DispatchQueue.main.async {[weak self] in
            self?.humans.removeAll()
        }
    }
    
    public func addCount(_ count:Int, infectedFactory:Int){
        DispatchQueue.main.async {[weak self] in
            for i in 1...count{
                self?.createNewHuman(infectionFactory: infectedFactory)
            }
        }
    }
    
    public func createNewHuman(infectionFactory:Int) {
        let human = makeHuman(status: .health, location: randomPosition(),infectionFactory: infectionFactory)
        humans.append(human)
    }
    
    public func removeHuman(){
        if(humans.isEmpty){
         return
        }
        humans.removeLast()
    }
    
    
    private func randomPosition()->CGPoint{
        let xCGPoint = CGFloat.random(in: 0...CGPointService.width)
        let yCGPoint = CGFloat.random(in: 0...CGPointService.height)
        return CGPoint(x: xCGPoint, y: yCGPoint)
    }
    
    
    private func makeHuman(status:InfectionStatus,location:CGPoint, infectionFactory:Int)-> HumanModel{
        let objectHuman = HumanModel(color: .green, size: .init(width: 15, height: 15))
        objectHuman.infectionCount = infectionFactory
        objectHuman.infectionCountCache = infectionFactory
        objectHuman.name = status.title
        objectHuman.physicsBody = SKPhysicsBody(circleOfRadius: 8)
        objectHuman.physicsBody!.contactTestBitMask = objectHuman.physicsBody!.collisionBitMask
        objectHuman.physicsBody?.affectedByGravity = false
        objectHuman.physicsBody?.friction = 0.0
        objectHuman.physicsBody?.angularDamping = 0.0
        objectHuman.physicsBody?.linearDamping = 0.0
        objectHuman.physicsBody?.restitution = 1.0
        objectHuman.physicsBody?.allowsRotation = false
        objectHuman.physicsBody?.isDynamic = true
        objectHuman.position = location
        return objectHuman 
    }
    
    
}

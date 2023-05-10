//
//  CGPointService.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 08.05.2023.
//

 
import SpriteKit


class CGPointService {
    static var screenSize:CGSize = UIScreen.main.bounds.size
    static let injected = CGPointService()
    private init(){}
    
    
  static var width = CGPointService.screenSize.width * 4
  static var height = CGPointService.screenSize.height * 1.2
    
   func randomPoint()->CGPoint{
        
       let xCGPoint = CGFloat.random(in: 0...CGPointService.width)
       let yCGPoint = CGFloat.random(in: 0...CGPointService.height)
        return CGPoint(x: xCGPoint, y: yCGPoint)
    }
    
    
    func randomVector(_ speed: CGFloat = 0.8) -> CGVector{
        let maxSpeed:CGFloat = speed
        let randomDx = CGFloat.random(in: -maxSpeed...maxSpeed)
        let randomDy = CGFloat.random(in: -maxSpeed...maxSpeed)
        return CGVector(dx: randomDx, dy: randomDy)
    }
    
}

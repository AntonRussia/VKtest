//
//  SimulationScene.swift
//  VirusSimulator
//
//  Created by Mac on 06.05.2023.
//

import SpriteKit
//import SwiftUI
//import Combine



class InfectionScene: SKScene,SKPhysicsContactDelegate{
    
    var store:SimulatorStore = SimulatorStore(state: SimulatorState(limitCount: 100),
                                                     reducer: SimulatorReducer())
    
    var viewModel: SimulationViewModel = SimulationViewModel()
   
    
    let cameraNode = SKCameraNode()
    var previousScale = CGFloat(1.0)
   
    
    override func didMove(to view: SKView) {

        cameraNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        addChild(cameraNode)
        camera = cameraNode
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.friction = 0.0
        physicsBody?.isDynamic = true
        physicsWorld.contactDelegate = self
        physicsWorld.speed = 0.5
        
       setupGesture(view: view)
    }
    
 

  
   @objc func pinched(sender:UIPinchGestureRecognizer){
     
      if sender.state == .began {
            previousScale = cameraNode.xScale
     }
       cameraNode.setScale(previousScale * 1 / sender.scale)
    }
 
    
 
    override func sceneDidLoad() {
       
       
        
 //MARK: ASYNC Scene
        //if neded load for big limit humans
         /*
          viewModel.viewDidLoad (comlict: {[weak self] human in
                await self?.addChild(human)
              //  human.physicsBody?.applyImpulse(self.cgPointService.randomVector(0.5))
            }, countHuman:  {[weak self] count in
                DispatchQueue.main.async {
                    _ =  self?.store.update(.add(count))
                    self?.viewModel.sendState(self?.store.state)
                }
              
           
        })*/
        
        viewModel.viewDidLoad (comlict: {[weak self] human in
            self?.addChild(human)
            
        }, countHuman:  {[weak self] count in
            DispatchQueue.main.async {
                _ =  self?.store.update(.add(count))
                self?.viewModel.sendState(self?.store.state)
            }
    })
 
        
    }
  
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let location = touches.first?.location(in: self),
              let human = nodes(at: location).first as? HumanModel,
              let action = store.update(.sick(human))
        else  {return}
       
        run(action)
         
              viewModel.sendState(store.state)
        
        
    }

   
    public  func didBegin(_ contact: SKPhysicsContact) {
        
        guard let humanA = contact.bodyA.node as? HumanModel,
              let humanB = contact.bodyB.node as? HumanModel,
              let action = store.update(.infected(healthHuman: humanA, sickHuman: humanB))
        else {return}
        
        viewModel.sendState(store.state)
       
      
        run(action)
        
    }
    
    
    func setupGesture(view:SKView){
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinched))
           view.addGestureRecognizer(pinch)
    }

    
    
    
    
    
    
    
    deinit{
       /* for node in self.children {
            node.removeAllActions()
            guard let human = node as? HumanModel else {return}
            human.color = .green
            human.name = InfectionStatus.health.title
        } */
        print("deinit InfectionScene")
    }
}

extension InfectionScene:UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
         return true
    }
}

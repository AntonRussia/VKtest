//
//  SimulatorUIKitController.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 08.05.2023.
//

import UIKit
import SpriteKit
import SwiftUI


class SimulatorUIKitController:UIViewController,UIScrollViewDelegate {
    
    
    
    var infectionScene:InfectionScene = {
        let scene = InfectionScene(size:.init(width:CGPointService.width, height: CGPointService.height))
        scene.backgroundColor = .white
        scene.scaleMode = .resizeFill
        return scene
    }()
    
   
    var scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = false
        scroll.frame = .init(origin: .zero, size: CGPointService.screenSize)
        scroll.contentSize = .init(width:CGPointService.width, height: CGPointService.height)
        return scroll
    }()
    
    var imageView: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    
    let skView: SKView =  {
        let viewSk = SKView()
        viewSk.frame.size = .init(width:CGPointService.width, height:CGPointService.height)
        return viewSk
    }()


    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupScene()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    func setupScene(){
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(skView)
        scrollView.delegate = self
        skView.presentScene(infectionScene)
        
        
       // if infectionScene == nil{
            
            /*let scene = InfectionScene(size:.init(width:CGPointService.width, height: CGPointService.height))
            scene.backgroundColor = .white
            scene.scaleMode = .resizeFill*/
           // self.infectionScene = scene
        }
        
 

     

       

      
        /*if let view = self.view as? SKView, infectionScene == nil{
            let scene = InfectionScene(size:UIScreen.main.bounds.size)
            scene.backgroundColor = .white
            scene.scaleMode = .fill
            view.presentScene(scene)
            self.infectionScene = scene
        }*/
   // }
   /*
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
    }*/
    
    deinit{
        print("deinit SimulatorUIKitController \(self)")
    }
 
}


 

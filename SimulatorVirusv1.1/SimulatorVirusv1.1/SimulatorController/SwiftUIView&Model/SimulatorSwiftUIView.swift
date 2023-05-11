//
//  SimulatorSwiftUIController.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 07.05.2023.
//

import SwiftUI
import SpriteKit

class SimulatorSwiftUIViewViewModel{
    
    
}

struct SimulatorSwiftUIView:View {
    
    @Environment(\.navigationController) var navigationController
    @ObservedObject var viewModel = SimulatorSwiftUIViewModel()
   /* var scene:InfectionScene {
        let scene = InfectionScene()
        scene.size = UIScreen.main.bounds.size
        scene.backgroundColor = .white
        scene.scaleMode = .resizeFill
        return scene
    }*/
    
    
    
    var body: some View{
        
        ZStack{
          
                
            SimulatorUIkitRepresentController()
            // SpriteView(scene:scene)
          
            VStack(spacing: 0){
                Spacer()
                ZStack{
                    
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .frame(height: 80)
                    
                    ZStack{
                       /* RoundedRectangle(cornerRadius: 25)
                            .fill(.ultraThickMaterial)
                            .frame(height: 50)*/
                        HStack{
                            
                            InfectionProgressView()
                            
                            Spacer()
                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width:100,height: 35)
                                    .padding(.trailing, 20)
                                    .overlay {
                                        Text("Exit")
                                            
                                            
                                            .font(.system(size: 13))
                                            .opacity(0.5)
                                            .offset(x:-7)
                                    }
                              
                                  
                            }.onTapGesture {
                                Router.injected.back()
                                viewModel.reloadPopulation()
                            }
                                
                        
                        }.padding(.leading,20)
                        
                    }
                }
            }
            
            
        }.edgesIgnoringSafeArea(.all)
        
    }
}


struct SimulatorSwiftUIView_preview:PreviewProvider{
    static var previews: some View{
        SimulatorSwiftUIView()
    }
}

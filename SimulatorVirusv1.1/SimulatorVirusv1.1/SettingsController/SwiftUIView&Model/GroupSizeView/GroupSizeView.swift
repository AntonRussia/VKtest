//
//  GroupSizeView.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 10.05.2023.
//

import SwiftUI

 



struct GroupSizeView: View {
    
    
    @GestureState var location:CGPoint  = .init(x: CGPointService.screenSize.width/2, y:  CGPointService.screenSize.height/3)
    @ObservedObject var viewModel = GroupSizeViewModel()
    //.zero
    @Namespace var gestureGlobal
    
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            let width = (size.width/10)
            //let itemCount = 3//(Int((size.height/width).rounded()) * 10)
            
            let itemCount = viewModel.humans.count > 70 ?  200: viewModel.humans.count
            
            LinearGradient(colors: [.red, .yellow, .green, .blue,.blue, .purple, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            
                .mask {
                    
                    
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 0), count: 10),spacing: 0) {
                        ForEach(0..<itemCount,id:\.self){ index in
                            GeometryReader { innerProxy in
                                
                                let rect = innerProxy.frame(in:.named(gestureGlobal))
                                let scale = itemScale(rect: rect, size: size)
                                
                                let transformRect = rect.applying(.init(scaleX: scale, y: scale))
                                let transformetLocation = location.applying(.init(scaleX: scale, y: scale))
                                
                              
                                
                                    RoundedRectangle(cornerRadius: 4)
                                        
                                        .fill(.orange)
                                        .scaleEffect(scale)
                                    
                                        .offset(x: (transformRect.midX - rect.midX), y:(transformRect.midY - rect.midY) )
                                        .offset(x:location.x - transformetLocation.x   ,y:location.y - transformetLocation.y)
                                        
                                 
                            }.padding(5)
                            .frame(height:width)
                     
                            
                        }
                        
                        .animation(.spring(),value: viewModel.humans)
                    }
                    
                    
                    
                }
            
            
         
        }.drawingGroup()
        .onAppear(perform: viewModel.presentPopulation)
            
        .animation(.easeInOut, value: location)
       // .preferredColorScheme(.dark)
        //.padding(15)
        .edgesIgnoringSafeArea(.all)
            .gesture(
                DragGesture(minimumDistance: 0).updating($location, body: { value, out, _ in
                    out = value.location
                })
            )
            .coordinateSpace(name: gestureGlobal)
    }
    
    func itemScale(rect:CGRect, size:CGSize)->CGFloat {
        let a = location.x - rect.midX
        let b = location.y - rect.midY
        let root = sqrt((a * a)+(b * b))
        let diogonalValue = sqrt((size.width * size.width) + (size.width * size.height))
        let scala =  root/(diogonalValue/2)
         
        let modificateScale = location == .zero ? 1:(1 - scala)
        return modificateScale > 0 ? modificateScale: 0.001
    }
}

struct GroupSizeView_Previews: PreviewProvider {
    static var previews: some View {
        GroupSizeView()
    }
}

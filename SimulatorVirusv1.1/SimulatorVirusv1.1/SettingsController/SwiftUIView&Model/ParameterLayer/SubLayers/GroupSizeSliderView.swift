//
//  GroupSizeSliderView.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 10.05.2023.
//

import SwiftUI



struct ConfigSilder {
    var progress:CGFloat = 0
    var lastProgress:CGFloat = 0
    var shrink:Bool = false
    var expand:Bool = false
}
struct GroupSizeSliderView:View {
    
    let iconName:String
    var animationID:String
    var namespaceID:Namespace.ID
    var cornerRadus:CGFloat
    var show:Bool = true
    
    @Binding var config:ConfigSilder
    @EnvironmentObject var store:Store
    
    var body: some View{
        GeometryReader {  proxy in
            
            let size = proxy.size
            
            
            if (show) {
           
                RoundedRectangle(cornerRadius: cornerRadus)
                    .fill(.thinMaterial)
                    .frame(height: 39)
                    //.opacity(0.3)
                    .overlay {
                        RoundedRectangle(cornerRadius: cornerRadus)
                            .fill(Color.white)
                            .scaleEffect(x:config.progress,anchor: .leading)
                    }
                    .overlay(alignment:.leading){
                        Image(iconName)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 29, height: 29)
                            .blendMode(.exclusion)
                            .font(.title)
                            .foregroundColor(.gray)
                            .padding(.leading, 15)
                        
              
                        
                    }.clipShape(RoundedRectangle(cornerRadius: cornerRadus, style: .continuous))
                    .scaleEffect(config.shrink ? 0.95 : 1)
                    .animation(.easeInOut, value: config.shrink)
                    .matchedGeometryEffect(id: animationID, in: namespaceID)
                    .animation(.easeInOut, value: config.progress)
                    .gesture(
                        LongPressGesture(minimumDuration: 0.3).onEnded({ _ in
                           
                            expandedView()
                        })
                        .simultaneously(with: DragGesture().onChanged({ value in
                           
                                let startlocation = value.startLocation.x
                                let currentlocation = value.location.x
                                let offset  =  currentlocation - startlocation
                                var progress = (offset/size.width) + config.lastProgress
                                progress = max(0, progress)
                                progress = min(1,progress)
                                config.progress = progress
                      
                          
                        }).onEnded({ value in
                            updateStateLogic(config.progress)
                            config.lastProgress = config.progress
                            
                        }))
                    )
            }
        }
    }
    
    func updateStateLogic(_ progress:CGFloat){
        let groupSize = store.appState.groupSize
        let groupSizeSelected = Int(progress * 100)
        if( groupSize != groupSizeSelected){
           let result = groupSize - groupSizeSelected
            
            result > 0 ?
          
                store.dispatch(.decriment(.groupRemove(result)))
           
         
            
            :
        
                store.dispatch(.increment(.addToGroup(result * -1)))
          
       
        }
    }
    
    func expandedView(){
        config.shrink = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            config.shrink = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                config.shrink = true
                
                if(config.progress == 1){
                    config.progress = 0
                    config.lastProgress = 0
                    store.dispatch(.decriment(.removeAll))
                    return
                }
                
                updateStateLogic(config.progress)
                config.progress = 1
                config.lastProgress = 1
                updateStateLogic(config.progress)
            }
        }
    }
}


struct GroupSizeSlider_Priview:PreviewProvider{
    static var previews: some View{
        CreateGroupSizeLayer()
            .environmentObject(Store(appState: .init(), reducer: .init()))
    }
}

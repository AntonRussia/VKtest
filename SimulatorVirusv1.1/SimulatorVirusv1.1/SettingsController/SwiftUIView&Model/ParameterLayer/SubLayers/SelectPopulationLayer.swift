//
//  SelectPopulation.swift
//  VirusSimulator
//
//  Created by Mac on 05.05.2023.
//

import SwiftUI




struct CreateGroupSizeLayer: View {
    
    let tapperColor:Color = .clear
 
    @State var groupSizeConfig: ConfigSilder = .init()
    @Namespace var groupSizeSlider
    @EnvironmentObject var store:Store
    
    var body: some View {
        
        ZStack{
             Color.gray.opacity(0.2)
                    .edgesIgnoringSafeArea(.all)
                ZStack{
                    interactivControls($groupSizeConfig, width: 100)
                        .padding(.vertical,8)
                    HStack{
                        Text("Group Size")
                            .font(.custom("SF", size: 13))
                            .padding(.leading,55)
                        Spacer()
                        counter()
                           .padding(.trailing,14)
                    }
            }
            .padding(.horizontal,15)
        }
        .frame(height:55)
        .animation(.easeIn(duration: 0.2), value: groupSizeConfig.expand)

    }
    
    @ViewBuilder
    func interactivControls(_ config:Binding<ConfigSilder>, width:CGFloat) -> some View {
     
        GroupSizeSliderView(iconName: "add", animationID: "GROUPSIZE", namespaceID: groupSizeSlider, cornerRadus: 35,show: true, config: config)
    }
    
    @ViewBuilder
    func counter() -> some View {
        ZStack(alignment: .center){
          
              Circle()
                .fill(Color.white)
                .frame(width: 25)
                .padding(.horizontal,0)
            Text("\(store.appState.groupSize)")
                .font(.system(size: 13))
        }
    }
}

struct SelectPopulation_Previews: PreviewProvider {
    static var previews: some View {
        CreateGroupSizeLayer()
            .environmentObject(Store(appState: .init(), reducer: .init()))
    }
}


/* @ViewBuilder
 func expandedControls(_ config:Binding<ConfigSilder>, width:CGFloat)-> some View {
     if(groupSizeConfig.expand){
          
             GroupSizeSliderView(iconName: "add", animationID: "GROUPSIZE", namespaceID: groupSizeSlider, cornerRadus: 35,config: config, show: groupSizeConfig.expand)
                .frame(height: width * 1.35)
                   .rotationEffect(.degrees(-90))
                   
                
             
         
     }
 }*/


/*
 
 
 
 var tapperPlus: some View {
     ZStack{
         Rectangle()
             .fill(tapperColor)
             .frame(height: 35)
         Text("+")
            
         .foregroundColor(Color.gray)
     }
 }
 
 var tapperMinus:some View {
     ZStack{
         Rectangle()
             .fill(tapperColor)
             .frame(height: 35)
         Text("-")
         .foregroundColor(Color.gray)
     }
 }
 

*/

        //  ZStack{
            /*  Rectangle()
                  .fill(Color.gray.opacity(0.1))
                  .frame(height: 50)
            
              
              HStack{
                  Spacer()
                tapperMinus
                  .onTapGesture {
                      store.dispatch(.decriment(.groupSize))
                  }
                  counter()
                  Text("Group Size")
                  tapperPlus
                    .onTapGesture {
                        store.dispatch(.increment(.groupSize))
                     
                  }
                  Spacer()*/
             // }
              // }
         
      //    .animation(.easeIn, value: store.appState.groupSize)

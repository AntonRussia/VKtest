//
//  InfectionFactorLayer.swift
//  VirusSimulator
//
//  Created by Mac on 05.05.2023.
//

import SwiftUI




class InfectionFactorViewModel:ObservableObject {
    @Published var count:Int = 0
    @Published var isMaxCount = false
    
    func incriment(){
      
        count = count < 4 ? count + 1: count
    }
    
    func dicriment(){
        count = count > 0 ? count - 1 : count
    }
    
  
    
}

struct InfectionFactorLayer: View {
    
   // @AppStorage( "InfectionFactor") var infectionFactor: Int = 0
    
    //@ObservedObject var infectionViewModel = InfectionFactorViewModel()
    @EnvironmentObject var store:Store
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                
                .frame(height: 50)
            HStack{
               
                Text("Infection Factory")
                    .font(.custom("SF", size: 13))
                ForEach(1...4,id: \.self) { index in
                   
                  
                    ZStack{
                        Circle()
                            .foregroundColor(changeBgColor(index))
                            .frame(width: 10)
                            .padding(.horizontal,8)
                    }
                }
               
                  
                counter
                
                
            }
        }
       
        
     
        
        .animation(.spring(), value: store.appState.infectionFactory)
        .onTapGesture {
            store.dispatch(store.appState.nextActionForInfectionFactory)
        }
        
    }
    
    @ViewBuilder
    var counter: some View {
        ZStack(alignment: .center){
          
              Circle()
                .fill(Color.white)
                .frame(width: 25)
                .padding(.horizontal,0)
            Text("\(store.appState.infectionFactory)")
                .font(.system(size: 13))
        }
    }
  
    
    func changeBgColor(_ index: Int) -> Color{
        store.appState.infectionFactory >= index ? Color.black.opacity(10.9):Color.gray.opacity(0.3)
    }
}

struct InfectionFactorLayer_Previews: PreviewProvider {
    static var previews: some View {
        InfectionFactorLayer()
            .environmentObject(Store(appState: .init(), reducer: .init()))
    }
}

//
//  ParametrScreen.swift
//  VirusSimulator
//
//  Created by Mac on 05.05.2023.
//

import SwiftUI

struct ParametrLayer: View {
    
    
     
   
    var body: some View {
   
       
            ZStack {
                
                VStack(spacing: 0){
                    
                   // Rectangle()
                    
                    CreateGroupSizeLayer()
          
                    InfectionFactorLayer()
                    
                    
                    
                   
        
            }.edgesIgnoringSafeArea(.vertical)
                
        } 
        }
    
    
 
    
}

struct ParametrScreen_Previews: PreviewProvider {
    static var previews: some View {
        ParametrLayer()
            .environmentObject(Store(appState: .init(), reducer: .init()))
    }
}

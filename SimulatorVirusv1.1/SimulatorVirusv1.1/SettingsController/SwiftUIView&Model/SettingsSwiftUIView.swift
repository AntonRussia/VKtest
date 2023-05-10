//
//  SettingsSwiftUIView.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 07.05.2023.
//

import SwiftUI




struct SettingsSwiftUIView:View {
    
    @Environment(\.navigationController) var navigationController
   // @ObservedObject var viewModel = SettingsViewModel()
    @State var store: Store = Store(appState: SettingsState(), reducer: Reducer())
    
    
    
    @State var isPressedStart:Bool = false
    
    var body: some View{
        ZStack{
            GroupSizeView()
            VStack(spacing: 0){
               Spacer()
                VStack(spacing: 0){
                    ParametrLayer()
                        .environmentObject(store)
                    
                    
                    startSimulationView
                        .onTapGesture {
                            isPressedStart = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                                isPressedStart = false
                                store.dispatch(.increment(.refresh))
                                Router.injected.route(to: .Simulator)
                            })
                         
                        }
                        .padding(.bottom,40)
                }
              
                .background(.ultraThinMaterial)
                .frame(height: 150)
            }
            
        }.edgesIgnoringSafeArea(.bottom)
    }
    
    
    
    @ViewBuilder
    var startSimulationView:some View {
        ZStack{
            Rectangle()
                .fill(Color.black.opacity(0.15))
                .frame(height: 80)
            
          
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.gray.opacity(0.2))
                        .frame(height: 50)
                        .padding(.horizontal)
                        .scaleEffect(isPressedStart ? 0.95:1)
                    HStack(alignment: .center){
                        Text("▶︎")
                            .foregroundColor(.black)
                            .font(.system(size: 13))
                            .opacity(0.5)
                        
                        Text("Start Simulation")
                            .font(.custom("SF", size: 13))
                           // .foregroundColor(.black)
                           // .font(.system(size: 17))
                            .opacity(0.5)
                    }
              
            }

          
        }
    }
}


struct SettingsSwiftUIView_preview:PreviewProvider{
    static var previews: some View{
        SettingsSwiftUIView()
    }
}

//
//  LoadSwiftUIController.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 07.05.2023.
//

import SwiftUI

struct LoadSwiftUIController: View {
    
    @Environment(\.navigationController) var navigationController
    
    var body: some View {
        VStack{
            Spacer()
            Text("load..))")
            
            Spacer()
           

        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                Router.injected.route(to: .Settings,fromController: navigationController)
            })
        }
    }
}

struct LoadSwiftUIController_Previews: PreviewProvider {
    static var previews: some View {
        LoadSwiftUIController()
    }
}
/*
Button {
     
} label: {
    ZStack{
        Rectangle()
            .fill(.gray.opacity(0.1))
            .frame(height: 50)
            .padding(.horizontal,20)
        Text("Next")
    }.onTapGesture {
       
        Router.injected.route(to: .Settings,fromController: navigationController)
    }
}
*/

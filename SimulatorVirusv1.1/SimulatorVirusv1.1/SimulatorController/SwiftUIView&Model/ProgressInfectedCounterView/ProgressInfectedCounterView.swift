//
//  InfectionProgressView.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 10.05.2023.
//

import SwiftUI
import Combine





struct InfectionProgressView: View {
    
    
    @ObservedObject var viewModel = ProgressInfectedCounterView()
     
    
    var body: some View {
        HStack{
            ProgressHealthView(img: "health", title: "health", count: viewModel.infectedProgressState?.healthCount ?? 0, sizeImg: .init(width: 20, height: 19), color: .white)
                .environmentObject(viewModel)
            
            ProgressSickView(img: "infection", title: "infection", count: viewModel.infectedProgressState?.sickCount ?? 0, sizeImg: .init(width: 25, height: 25), color: .white)
                .environmentObject(viewModel)
        }
    }

}

struct InfectionProgressView_Previews: PreviewProvider {
    static var previews: some View {
        InfectionProgressView()
    }
}

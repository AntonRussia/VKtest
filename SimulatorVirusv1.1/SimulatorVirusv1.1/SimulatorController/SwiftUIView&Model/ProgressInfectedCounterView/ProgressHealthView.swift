//
//  ProgressHealthView.swift
//  SimulatorVirusv1.1
//
//  Created by Mac on 10.05.2023.
//

import SwiftUI

struct ProgressHealthView: View {
    let img:String
    let title:String
    let count:Int
    let sizeImg:CGSize
    let color:Color
    let changeColor:Color = .green
    @EnvironmentObject var viewModel:ProgressInfectedCounterView
    @State var  isChangeState:Bool = false
    var body: some View {
   
            ZStack{
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.black.opacity(0.4))
                    .frame(width:75,height: 35)
                HStack{
                    Image(img)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: sizeImg.width, height: sizeImg.height)
                    
                        .font(.title)
                        .foregroundColor( isChangeState ?.green : color)
                        .padding(.leading, 15)
                    Text("\(count)")
                        .font(.custom("SF", size: 17))
                        .fontWeight(.bold)
                        .foregroundColor(.white.opacity(1))
                    
                }
                .padding(.trailing,12)
                .onChange(of: viewModel.infectedProgressState?.healthCount) { _ in
                        withAnimation(.easeInOut){
                            isChangeState = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                            withAnimation(.easeInOut){
                                isChangeState = false
                            }
                            
                        })
                    }
            }
        }
   
 
}

struct ProgressHealthView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressHealthView(img:"health", title: "health", count: 1, sizeImg:.init(width: 19, height: 19), color: .white)
            .environmentObject(ProgressInfectedCounterView())
    }
}

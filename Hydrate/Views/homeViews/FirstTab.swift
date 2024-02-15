//
//  FirstTab.swift
//  Hydrate
//
//  Created by Juman Dhaher on 05/08/1445 AH.
//

import SwiftUI

struct FirstTab: View {
    let litters: Double
    @State var progress: Double = 0.0
    @State var value: Double = 0.0
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Today's water intake")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                Text("\(progress, specifier: "%.1f") / \(litters, specifier: "%.1f")")
                    .font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                
                
                VStack{
                    CircularProgressView(progress: value,litters: litters).frame(width: 300)
                    
                    HStack{
                        Button(action: {
                            if(progress != 0){
                                progress = progress - 0.5
                                value = value - 0.18
                            }
                        }, label: {
                            Image(systemName: "minus.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                        })
                        
                        Spacer()
                        Text("\(progress, specifier: "%.1f")")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        
                        Button(action: {
                            if(progress <= litters){
                                progress =  progress + 0.5
                                
                                value = (value + 0.18)
                            }
                        }, label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                        })
                        
                    }.padding()
                    
                    Button("Reset") {
                        resetProgress()
                    }.buttonStyle(.borderedProminent)
                    
                }
            }.padding(30)
        }
    }
    func resetProgress() {
        progress = 0
        value = 0
    }
    
}

#Preview {
    FirstTab(litters: 2.8)
}


struct CircularProgressView: View {

    let progress: Double
    let litters: Double

    @State private var angle: Double = -90

    var body: some View {
        
        ZStack{
            
                Circle()
                    .stroke(
                        Color.accent.opacity(0.5),
                        lineWidth: 30
                    )
                
                
                Circle()
                    .trim(from: -0.9, to: 0.02)
                    .stroke(
                        Color.accent,
                        style: StrokeStyle(
                            lineWidth: 30,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut, value: progress)

                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, litters)))
                    .stroke(
                        Color.accent,
                        style: StrokeStyle(
                            lineWidth: 30,
                            lineCap: .round,
                            lineJoin: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                // 1
                    .animation(.easeOut, value: progress)
        }
        
    }
}

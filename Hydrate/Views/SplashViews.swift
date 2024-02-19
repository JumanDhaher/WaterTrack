//
//  SplashViews.swift
//  Hydrate
//
//  Created by Juman Dhaher on 04/08/1445 AH.
//

import SwiftUI

struct SplashViews: View {
    @Binding var isOnboarding: Bool
    @State private var isActive = false
    @State private var size = 0.3
    @State private var opacity = 0.3
    
    @AppStorage("liters") var litersData: Double?
    @AppStorage("cups") var cupsData: Double?
    
    var body: some View {
        ZStack {
            if self.isActive {
                if isOnboarding {
                    ContentView()
               }else{
                   if(litersData == 0.0 && cupsData == 0.0){
                       ContentView()
                   }
                   else{
                       HomeViews(liters: litersData ?? 0.0 , cups: litersData ?? 0.0 )
                   }
                }
            } else {
        
                VStack{
                    Image("splash_logo")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.9)) {
                                self.size = 1.8
                                self.opacity = 1.6
                            }
                        }
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                self.isActive = true
                            }
                        }
                }
        }
        
        
        
        
    }
    }
}

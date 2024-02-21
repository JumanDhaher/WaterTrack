//
//  ContentView.swift
//  Hydrate Watch App
//
//  Created by Juman Dhaher on 03/08/1445 AH.
//

import SwiftUI

struct ContentView: View {
    @StateObject var watchConnector = WatchToIOSConnecter()
    @State private var incrementValue: Double = 0.10

    var body: some View {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                Button("Increment"){
                    incrementValue =  1 + 1
                }
                
            }
            .padding()
    }
    
    func sendWaterLitters(){
        let litters = incrementValue
        watchConnector.sendCountWaterToIOS(litters: litters)
    }
}

#Preview {
    ContentView()
}

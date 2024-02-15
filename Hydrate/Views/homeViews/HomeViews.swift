//
//  HomeViews.swift
//  Hydrate
//
//  Created by Juman Dhaher on 04/08/1445 AH.
//

import SwiftUI

struct HomeViews: View {
    let litters: Double
    let cups: Double

    @State private var selectedItem = 1


    var body: some View {
        VStack{
            TabView(selection: $selectedItem){
                FirstTab(litters: litters)
                    .tag(1)

                SecondTab(cups: cups)
                    .tag(2)

            }
            if(selectedItem == 1){
                Text("Swipe right for cups calculating")
            }else{
                Text("Swipe left for liters calculating")
            }
        }.navigationBarBackButtonHidden()
        .tabViewStyle(.page)
            .background(.black.opacity(0.1))
            .onChange(of: selectedItem) {
                value in selectedItem = value
            }
    }
   
}

#Preview {
    HomeViews(litters: 2.8, cups: 12)
}

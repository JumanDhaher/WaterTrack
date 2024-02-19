//
//  HomeViews.swift
//  Hydrate
//
//  Created by Juman Dhaher on 09/08/1445 AH.
//

import SwiftUI

struct HomeViews: View {
    @State private var currentPage = 0
    @State var liters: Double
    @State var cups: Double
    
    var body: some View {
        TabView(selection: $currentPage) {
            LiterView(liters: liters)
            .tag(0)
            
           SecondTab(cups: cups)
                .tag(1)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .environment(\.colorScheme, UIApplication.shared.windows.first?.rootViewController?.traitCollection.userInterfaceStyle == .dark ? .dark : .light)
        .navigationBarBackButtonHidden()
        .overlay(
                   VStack {
                       HStack(spacing: 8) {
                           ForEach(0..<2) { index in
                               Circle()
                                   .frame(width: 8, height: 8)
                                   .foregroundColor(index == currentPage ? Color(.darkBlue) : Color.gray.opacity(0.6))
                           }
                       }
                       .padding([.top, .leading, .trailing], 700.0)

                       Text("Swipe right for cups calculating")
                         .font(.caption2)
                         .fontWeight(.regular)
                         .foregroundColor(Color(.darkGrey))
                           .padding(.bottom, 10)
                   }
               )
    
    }
}

#Preview {
    HomeViews(liters: 2.5, cups: 12)
}

//
//  HomeViews.swift
//  Hydrate
//
//  Created by Juman Dhaher on 09/08/1445 AH.
//

import SwiftUI

struct HomeView: View {
    @State private var isFilled = false
    @State private var currentPage = 0
    @State var liters: Double
    @State var cups: Double
    
    var body: some View {
        TabView(selection: $currentPage) {
            LiterView(liters: liters)
                .tag(0)
            
            SecondTab(isFilled: $isFilled, liters: $liters, cups: cups) // Pass liters as binding
                .tag(1)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

//        .environment(\.colorScheme, UIApplication.shared.windows.first?.rootViewController?.traitCollection.userInterfaceStyle == .dark ? .dark : .light)
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
                
                if currentPage == 0 {
                    Text("Swipe right for cups calculating")
                        .font(.caption2)
                        .fontWeight(.regular)
                        .foregroundColor(Color(.darkGrey))
                        .padding(.bottom, 10)
                } else if currentPage == 1 {
                    Text("Swipe right for liters calculating")
                        .font(.caption2)
                        .fontWeight(.regular)
                        .foregroundColor(Color(.darkGrey))
                        .padding(.bottom, 10)
                }
            }
        )
    }
}

#Preview {
    HomeView(liters: 2.5, cups: 12)
}

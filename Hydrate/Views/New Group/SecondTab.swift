//
//  SecondTab.swift
//  Hydrate
//
//  Created by Juman Dhaher on 05/08/1445 AH.
//
import SwiftUI

struct SecondTab: View {
    @Binding var isFilled: Bool
    @Binding var liters: Double // Binding for liters

    let cups: Double
    private let flexibleColumn = [
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200))
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Today's water intake")
                    .font(.custom("SF Pro", size: 16))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 30)
                    .padding(.vertical)
                
                Text(" 0 / \(cups, specifier: "%.1f")")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal, 30)
                
                LazyVGrid(columns: flexibleColumn, spacing: 50) {
                    ForEach(0..<Int(cups)) { index in
                        VStack {
                            Image(isFilled ? "DropFill" : "DropEmpty")
                                .onTapGesture {
                                    // Toggle isFilled and increment or decrement liters based on the action
                                    isFilled.toggle()
                                    if isFilled {
                                        liters += 0.1 // Increase liters
                                    } else {
                                        liters -= 0.1 // Decrease liters
                                    }
                                }
                            Text("1 cup")
                                .foregroundColor(.gray)

                        }
                    }
                }
            }.padding(50)
        }
    }
}



//#Preview {
//    SecondTab(isFilled: <#Binding<Bool>#>, cups: 12)
//}

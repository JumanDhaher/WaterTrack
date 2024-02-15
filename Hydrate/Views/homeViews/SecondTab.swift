//
//  SecondTab.swift
//  Hydrate
//
//  Created by Juman Dhaher on 05/08/1445 AH.
//

import SwiftUI

struct SecondTab: View {
    let cups: Double
    private let flexibleColumn = [
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200)),
        GridItem(.flexible(minimum: 100, maximum: 200))
    ]
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Today's water intake")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 30)
                
                Text(" 0 / \(cups, specifier: "%.1f")")
                    .font(.largeTitle).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 30)
                
                
                LazyVGrid(columns: flexibleColumn, spacing: 50) {
                    ForEach(0..<Int(cups)){index in
                        VStack{
                            Image("waterImage")
                            Text("\(index) cup")
                        }
                    }
                }
                
                
                
            }.padding(50)
        }
    }
}

#Preview {
    SecondTab(cups: 12)
}

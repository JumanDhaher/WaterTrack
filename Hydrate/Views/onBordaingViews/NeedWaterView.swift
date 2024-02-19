//
//  NeedWaterView.swift
//  Hydrate
//
//  Created by Juman Dhaher on 04/08/1445 AH.
//

import SwiftUI

struct NeedWaterView: View {
    @State var cups: Double
    @State var liters: Double

    var body: some View {
            VStack(alignment:.leading,spacing: 10) {
                
                Spacer(minLength: 15)
                
                Text("The needed Water intake")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Your body needs \(liters) liters of hydration,\nwhich is equvalent to \(cups) cups")  
                    .font(.body)
                    .foregroundColor(Color.gray)
                    .padding(.bottom, 25)
                
                
                
                HStack(spacing: 30){
                    ZStack{
                        RoundedRectangle(cornerRadius: 20 )
                            .foregroundColor(.gray.opacity(0.2))
                            .frame(width: 160, height: 159)
                        
                        VStack{
                            Image("CupImage")
                            HStack{
                                Text("\(cups, specifier: "%.2f")")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text("cups")
                                    .font(.custom("SF Pro", size: 17))   .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20 )
                            .foregroundColor(.gray.opacity(0.2))
                            .frame(width: 160, height: 159)
                        VStack{
                            Image("LiterImage")
                            HStack{
                                Text("\(liters, specifier: "%.2f")")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text("L")
                                    .font(.custom("SF Pro", size: 17))   .foregroundColor(.gray)
                            }                        }
                        
                    }
                }
                
                Spacer()
                
                NavigationLink(destination: NotificationView(liters: liters, cups: cups), label: {
                    Text("Set Notification")
                        .frame(width: 358,height: 55)
                        .background(.accent)
                        .foregroundColor( .white )
                        .cornerRadius(12)
                })
                
                
            }.padding(.vertical, 30)
    }
}

#Preview {
    NeedWaterView(cups: 12, liters: 2.4)
}

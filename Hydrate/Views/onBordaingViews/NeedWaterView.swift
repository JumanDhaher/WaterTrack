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
        ScrollView{
            VStack(alignment:.leading,spacing: 10) {
                
                Text("The needed Water intake")
                    .font(.title2).fontWeight(.bold)
                
                Text("Your body needs \(liters) liters of hydration,\nwhich is equvalent to \(cups) cups").foregroundColor(.gray).font(.footnote).multilineTextAlignment(.leading)
                
                HStack(spacing: 30){
                    ZStack{
                        RoundedRectangle(cornerRadius: 20 )
                            .foregroundColor(.gray.opacity(0.2))
                            .frame(width: 120,
                                height: 120)
                        VStack{
                            Image("CupImage")
                            Text("\(cups, specifier: "%.2f")cups")
                        }
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20 )
                            .foregroundColor(.gray.opacity(0.2))
                            .frame(width: 120,
                                height: 120)
                        VStack{
                            Image("LiterImage")
                            Text("\(liters, specifier: "%.2f")L")
                        }

                    }
                }
                NavigationLink(destination: NotificationView(liters: liters, cups: cups), label: {
                    Text("Set Notification")  
                        .frame(width: 358,height: 55)
                        .background(.accent)
                        .foregroundColor( .white )
                        .cornerRadius(12)
                        .padding(.bottom, 30)
                })
                
                
            }.padding(.top, 50)
        }
    }
}

#Preview {
    NeedWaterView(cups: 12, liters: 2.4)
}

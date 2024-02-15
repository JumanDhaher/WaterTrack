//
//  NeedWaterView.swift
//  Hydrate
//
//  Created by Juman Dhaher on 04/08/1445 AH.
//

import SwiftUI

struct NeedWaterView: View {
    @State var cups: String
    @State var liters: String

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
                        
                        Text("\(cups)cups")
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20 )
                            .foregroundColor(.gray.opacity(0.2))
                            .frame(width: 120,
                                height: 120)
                        
                        Text("\(liters)L")

                    }
                }
                NavigationLink(destination: NotificationView(), label: {
                    Text("Set Notification").frame(width: 280,height: 40)
                             .background(.accent)
                             .foregroundColor( .white )
                             .cornerRadius(8)
                })
                
                
            }.padding(.top, 50)
        }
    }
}

#Preview {
    NeedWaterView(cups: "12", liters: "2.4")
}

//
//  ContentView.swift
//  Hydrate
//
//  Created by Juman Dhaher on 03/08/1445 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var weight: Double?
    @State private var readyToNavigate : Bool = false
    @State private var cups = 0.0
    @State private var liters = 0.0
    
    var body: some View {
        NavigationStack{
                VStack(alignment:.leading) {
                    
                    sectionTitle
                    
                    
                    textField.padding(.top,30)
                    
                    Spacer()

                    if(weight == nil){
                        notCalculateButton
                    }else{
                        Button(action: {
                            if(weight != nil && weight != 0){
                                let dataLiters = ((weight ?? 1) * 0.03)
                                liters = dataLiters
                                
                                let dataCups = dataLiters / 0.24
                    
                                cups = dataCups
                                
                                if(cups != 0 && liters != 0){
                                    readyToNavigate = true
                                }
                            }
                        }, label: {
                            calculateButton
                        }).navigationDestination(isPresented: $readyToNavigate) {
                            NeedWaterView(cups: cups, liters: liters)
                        }
                    }
                    
                    
                }.padding(.top, 50)
            }
    }
}


#Preview {
    ContentView()
}

extension ContentView{
    
    
    private var sectionTitle: some View {
        VStack(alignment: .leading, spacing: 10){
            Image("splash_logo")
            Text("iHydrate")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            Text("Start with IHydtaye to record and track your\nwater intake daily based on your needs and\nstay hydrated")  
                .font(.body)
                .foregroundColor(Color.gray)
                .padding(.horizontal)

        }
    }
    
    private var textField: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray.opacity(0.2))
                .frame(width: 358, height: 44)
                HStack{
                    Text("Body Weight")

                    TextField("weight",value: $weight, format: .number).textFieldStyle(.plain)
                        .foregroundColor(Color.gray).frame(width: 55)
                    
                    Text("Kg")
                        .foregroundColor(Color("textColor"))
                }
                
            .frame(width: 320, height: 24,alignment: .leading)
        }
    }
    
    private var notCalculateButton: some View {
        Text("Calculate Now")  .frame(width: 358, height: 55.0)
            .background(Color("unclickButton"))
                .foregroundColor( .black.opacity(0.4) )
                .cornerRadius(12)
                .padding(.bottom, 30)
}
    
    
    
       private var calculateButton: some View {
          Text("Calculate Now")
               .frame(width: 358,height: 55)
                   .background(.accent)
                   .foregroundColor( .white )
                   .cornerRadius(12)
                   .padding(.bottom, 30)
   }
    
}

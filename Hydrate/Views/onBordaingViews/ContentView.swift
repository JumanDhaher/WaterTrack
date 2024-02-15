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
    @State private var cups = ""
    @State private var liters = ""
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment:.leading,spacing: 20) {
                    imageTitle
                    
                    Text("IHydrate").font(.title2).fontWeight(.bold)
                    
                    sectionTitle
                    
                    Spacer(minLength: 20)
                    
                    textField
                    
                    Spacer(minLength: 30)
                    
                    if(weight == nil){
                        notCalculateButton
                    }else{
                        Button(action: {
                            if(weight != nil && weight != 0){
                                let dataLiters = ((weight ?? 1) * 0.03)
                                liters = String(dataLiters.formatted(.number.precision(.fractionLength(2))))
                                
                                let dataCups = 4.22675 * dataLiters
                    
                                cups = String(dataCups.formatted(.number.precision(.fractionLength(2))))
                                
                                if(cups != "" && liters != ""){
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
}


#Preview {
    ContentView()
}

extension ContentView{
    
    private var imageTitle: some View {
        Image("waterImage")
           .resizable()
           .frame(width: 40, height: 40)
           .colorMultiply(Color("AccentColor"))
    }
    
    private var sectionTitle: some View {
        Text("Start with IHydtaye to record and track your\nwater intake daily based on your needs and\nstay hydrated").foregroundColor(.gray).font(.footnote).multilineTextAlignment(.leading)
    }
    
    private var textField: some View {
        LabeledContent {
            LabeledContent{
                Text("Kg")
                    .foregroundColor(Color("textColor"))
            }label: {
                TextField("weight",value: $weight, format: .number)
            }
             
        } label: {
          Text("Body Weight")
        }
        .padding()
            .frame(width: 280, height: 35)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray.opacity(0.3), lineWidth: 1))
            .frame(width: 280, height: 24)
        }
    
    private var notCalculateButton: some View {
       Text("Calculate Now").frame(width: 280,height: 40)
            .background(Color(.gray))
                .foregroundColor( .black.opacity(0.4) )
                .cornerRadius(8)
}
    
    
    
       private var calculateButton: some View {
          Text("Calculate Now").frame(width: 280,height: 40)
                   .background(.accent)
                   .foregroundColor( .white )
                   .cornerRadius(8)
   }
    
}

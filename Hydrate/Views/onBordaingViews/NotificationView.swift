//
//  NotificationView.swift
//  Hydrate
//
//  Created by Juman Dhaher on 04/08/1445 AH.
//

import SwiftUI

struct NotificationView: View {
    @State var liters: Double
    @State var cups: Double

    @State var dataTimeInMin = [
        TimeModel(timeNumber: "15", timeHour: "Mins", clickItem : false),
        TimeModel(timeNumber: "30", timeHour: "Mins", clickItem : false),
        TimeModel(timeNumber: "60", timeHour: "Mins", clickItem : false),
        TimeModel(timeNumber: "90", timeHour: "Mins", clickItem : false),
    ]
    

    @State var dataTimeInHours = [
        TimeModel(timeNumber: "2", timeHour: "Hours", clickItem : false),
        TimeModel(timeNumber: "3", timeHour: "Hours", clickItem : false),
        TimeModel(timeNumber: "4", timeHour: "Hours", clickItem : false),
        TimeModel(timeNumber: "5", timeHour: "Hours", clickItem : false)
    ]
    
    var body: some View {
        ScrollView{
            VStack(alignment:.leading,spacing: 10) {
                Text("The start and end hour")
                    .font(.title2).fontWeight(.bold)
                
                Text("Specify the start and end date to receive the notification").foregroundColor(.gray).font(.footnote).multilineTextAlignment(.leading)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20 )
                        .foregroundColor(.gray.opacity(0.1))
                        .frame(width: 360,
                            height: 100)
                    VStack(alignment: .leading){
                        
                        Text("Start hour")
                        Divider().padding(.horizontal,10)
                        Text("End hour")
                    }.padding(.horizontal)
                }
                
                Spacer(minLength: 30)
                
                Text("Notification interval")
                    .font(.title2).fontWeight(.bold)
                
                Text("How often would you like to recive notification within the\nspecified time interval").foregroundColor(.gray).font(.footnote).multilineTextAlignment(.leading)
                
                HStack{
                    ForEach(0..<4) { index in
                        Button(action: {
                            self.dataTimeInMin[index] =  TimeModel(timeNumber: dataTimeInMin[index].timeNumber, timeHour: dataTimeInMin[index].timeHour, clickItem: !dataTimeInMin[index].clickItem)
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8 )
                                    .foregroundColor(dataTimeInMin[index].clickItem ? Color(.accent) : .gray.opacity(0.1))
                                    .frame(width: 80,
                                        height: 80)
                                VStack(spacing: 10){

                                    Text(dataTimeInMin[index].timeNumber)
                                        .foregroundColor(dataTimeInMin[index].clickItem ? .white :.accent)
                                            .fontWeight(.bold)
                                  
                                    Text(dataTimeInMin[index].timeHour)
                                        .foregroundColor(dataTimeInMin[index].clickItem ? .white : Color("textColor"))
                                }
                            }
                        })

                }
                }
                
                HStack{
                    ForEach(0..<4) { index in
                        Button(action: {
                            self.dataTimeInHours[index] =  TimeModel(timeNumber: dataTimeInHours[index].timeNumber, timeHour: dataTimeInHours[index].timeHour, clickItem: !dataTimeInHours[index].clickItem)
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8 )
                                    .foregroundColor(dataTimeInHours[index].clickItem ? Color(.accent) : .gray.opacity(0.1))
                                    .frame(width: 80,
                                        height: 80)
                                VStack(spacing: 10){

                                    Text(dataTimeInHours[index].timeNumber)
                                        .foregroundColor(dataTimeInHours[index].clickItem ? .white :.accent)
                                            .fontWeight(.bold)
                                  
                                    Text(dataTimeInHours[index].timeHour)
                                        .foregroundColor(dataTimeInHours[index].clickItem ? .white : Color("textColor"))
                                }
                            }
                        })

                }
                }
                
                Spacer(minLength: 30)
                
               NavigationLink(destination: LiterView(), label: {
                    Text("Start").frame(width: 360,height: 40)
                             .background(.accent)
                             .foregroundColor( .white )
                             .cornerRadius(8)
                })
                
            }.padding(.top, 50)
                .padding()

        }.navigationTitle("Notification Preferences")
    }
}

#Preview {
    NotificationView(liters: 2.7, cups: 7)
}

class TimeModel{
    var timeNumber : String
    var timeHour : String
    @State var clickItem : Bool
    
    init(timeNumber: String, timeHour: String, clickItem: Bool) {
        self.timeNumber = timeNumber
        self.timeHour = timeHour
        self.clickItem = clickItem
    }
}




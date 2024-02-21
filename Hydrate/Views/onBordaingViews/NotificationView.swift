//
//  NotificationView.swift
//  Hydrate
//
//  Created by Juman Dhaher on 04/08/1445 AH.
//

import SwiftUI
import UserNotifications

struct NotificationView: View {
    @State var liters: Double
//    should be a Int
    @State var cups: Double
    
    @State var startHour = Date()
    @State var endHour = Date()
    
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 12), count: 4)
    
    @State var selectedInterval: String = ""
    @State var navigateToProgressTrack = false
    
    let intervals = [("15", "Mins"), ("30", "Mins"),("60", "Mins"), ("90", "Mins"),("2", "Hours"), ("3", "Hours"),("4", "Hours"), ("5", "Hours")]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Notification Preferences")
                .font(.title2)
                .fontWeight(.bold)

            Text("The start and End hour")
                .font(.headline)
                .fontWeight(.regular)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            Text("Specify the start and end date to receive the notifications")
                .font(.footnote)
                .padding(.bottom, 20)
                .foregroundColor(.gray)
            
            DatePickerView(startHour: $startHour, endHour: $endHour)
            
            NotificationIntervalView(
                liters: liters, cups: Double((cups)),
                selectedInterval: $selectedInterval, navigateToProgressTrack: $navigateToProgressTrack, intervals: intervals, columns: columns
            )
        }
        .padding(.horizontal, 15.0)
        .navigationTitle("Notification Preferences")
        .onAppear(){
                   // 1 checking for permission
                   UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                       if success {
                           print("Permission approved!")
                       } else if let error = error {
                           print(error.localizedDescription)
                       }
                   }
        }
    }
}

#Preview {
    NotificationView(liters: 2.7, cups: 7)
}

struct DatePickerView: View {
    @Binding var startHour: Date
    @Binding var endHour: Date
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(Color.lightherGrey)
                .frame(height: 150)
            VStack{
                DatePicker("Start hour", selection: $startHour, displayedComponents: .hourAndMinute)  .padding(.trailing, 140)
                Divider().padding(.vertical)
                DatePicker("End hour", selection: $endHour, displayedComponents: .hourAndMinute)
                    .padding(.trailing, 140.0)

            }.padding(.horizontal)
        }
    }
}

struct NotificationIntervalView: View {
    @State var liters: Double
    @State var cups: Double
    @Binding var selectedInterval: String
    @Binding var navigateToProgressTrack: Bool
    @State private var readyToNavigate : Bool = false

    @AppStorage("isOnboarding") var isOnboarding: Bool?
    @AppStorage("liters") var litersData: Double?
    @AppStorage("cups") var cupsData: Double?

    var intervals: [(String, String)]
    let columns: [GridItem]
    
    
    var body: some View {
        VStack{
            Text("Notification interval ")
                .font(.headline)
                .fontWeight(.regular)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            Text("How often would you like to receive notifications within the specified time interval")
                .font(.footnote)
                .padding(.bottom, 20)
                .foregroundColor(.gray)
            
        }
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(intervals, id: \.0) { interval in
                IntervalButton(interval: interval, selectedInterval: $selectedInterval)
            }
        }
     
        Button(action: {
            navigateToProgressTrack = true
            isOnboarding = false
            litersData = liters
            cupsData = cups
            print(selectedInterval)
            
            let content = UNMutableNotificationContent()
            content.title = "Drink Water"
            content.subtitle = "Don't forget that!"
            content.sound = UNNotificationSound.default
            
            var datComp = DateComponents()
            datComp.hour = 10
            datComp.minute = 36
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
            
            
            // choose a random identifier
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            // add our notification request
            UNUserNotificationCenter.current().add(request)

           readyToNavigate = true

        }, label: {
            Text("Start")
                    .frame(width: 370,height: 55)
                    .background(.accent)
                    .foregroundColor( .white )
                    .cornerRadius(12)
        })
        .padding(.top, 20)
        .navigationDestination(isPresented: $readyToNavigate) {
            HomeView(liters: liters, cups: cups)
        }
        
    }
}

struct IntervalButton: View {
    var interval: (String, String)
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var selectedInterval: String
    
    var body: some View {
        Button(action: {
            self.selectedInterval = interval.0
        }) {
            VStack {
                Text(interval.0)
                    .font(.system(size: 22))
                    .foregroundColor(selectedInterval == interval.0 ? Color("ColorToClick") : Color("AccentColor"))
                    .fontWeight(.bold)
                
                Text(interval.1)
                    .foregroundColor(selectedInterval == interval.0 ? (colorScheme == .dark ? .black : .white) : (colorScheme == .dark ? .white : .black))
                
                    .font(.system(size: 13))
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80)
            .background(selectedInterval == interval.0 ? Color("AccentColor") : Color("LightherGrey"))
            .cornerRadius(10)
        }
        
    }
}






//
//  HomeViews.swift
//  Hydrate
//
//  Created by Juman Dhaher on 04/08/1445 AH.
//

import SwiftUI

struct LiterView: View {
   @State var liters: Double
   @State private var totalliters: Double = 0.0
    @State private var incrementValue: Double = 0.10
 

    var body: some View {
        VStack {
            
           Text("Today's Water Intake")
                .font(.callout)
                .foregroundColor(Color(.darkGrey))
                .padding(.trailing,180)
           
           Text(String(format: "%.2f / %.2f Liters", totalliters, liters))
              .font(.title)
              .foregroundColor(Color(.black1))
              .fontWeight(.bold)
              .padding(.trailing,109)

            CircleProgressBar(progress: CGFloat(totalliters / liters), totalLiters: liters)
                .frame(width: 300, height: 300)
                .padding(.top, 50.0)
                .foregroundColor(Color(.darkBlue))

           
           

            CustomStepper(
               value: $totalliters,
                range: 0...liters,
                step: incrementValue,
                onIncrement: { addWater(amount: incrementValue) },
                onDecrement: { subtractWater(amount: incrementValue) }
            )
        }
    }

    private func addWater(amount: Double) {
        withAnimation {
            totalliters += amount
        }
    }

    private func subtractWater(amount: Double) {
        withAnimation {
            totalliters -= amount
            if totalliters < 0 {
                totalliters = 0
            }
        }
    }
    
    func sendWaterLitters(){
        let litters = incrementValue
    }
}
 
struct CustomStepper: View {
   @Binding var value: Double
   var range: ClosedRange<Double>
   var step: Double
   var onIncrement: () -> Void
   var onDecrement: () -> Void

   var body: some View {
       HStack(spacing: 10) {
           Button(action: {
               // Function to subtract water
               onDecrement()
           }) {
               Circle()
                   .frame(width: 50, height: 50)
                   .foregroundColor(Color(.lightherGrey))
                   .overlay(
                       Image(systemName: "minus")
                           .font(.title)
                           .foregroundColor(.darkBlue)
                   )
           }
           .disabled(value <= range.lowerBound)

           Text(" \(value, specifier: "%.1f")")
               .font(.title)
               .fontWeight(.bold)
               .padding(60)

           Button(action: {
               // Function to add water
               onIncrement()
           }) {
               Circle()
                   .frame(width: 50, height: 50)
                   .foregroundColor(Color(.lightherGrey))
                   .overlay(
                       Image(systemName: "plus")
                           .font(.title)
                           .foregroundColor(.darkBlue)
                   )
           }
           .disabled(value >= range.upperBound)
       }
   }
}


struct CircleProgressBar: View {
    var progress: CGFloat
    var totalLiters: Double
    
    private var emoji: String {
        let progressPercentage = Int(progress * 100)
        
        switch progressPercentage {
        case 0..<7:
            return "😴"
        case 15..<20:
            return "😃"
        case 30..<50:
            return "😁"
        case 70..<80:
            return "😍"
        case 90..<100:
            return "🥳"
        default:
            return ""
            
        }
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 40.0)
                .opacity(0.3)
                .foregroundColor(Color(.lightBlue))
            
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: 40.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.darkBlue)
                .rotationEffect(Angle(degrees: 270.0))
                .overlay(
                    emojiOverlay
                )
        }
    }
    
    private var emojiOverlay: some View {
        GeometryReader { geometry in
            let angle = 360 * progress - 90
            let xPosition: CGFloat
            let yPosition: CGFloat
            
            if progress >= 1.0 {
                
                xPosition = geometry.size.width / 2
                yPosition = geometry.size.height / 2
            } else {
                
                xPosition = geometry.size.width / 2 + (geometry.size.width / 2) * cos(angle * .pi / 180)
                yPosition = geometry.size.height / 2 + (geometry.size.height / 2) * sin(angle * .pi / 180)
            }
            return Text(emoji)
                .font(.system(size: 40))
                .position(x: xPosition, y: yPosition)
        }
    }
    
}

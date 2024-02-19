//
//  HomeViews.swift
//  Hydrate
//
//  Created by Juman Dhaher on 04/08/1445 AH.
//

import SwiftUI

struct LiterView: View {
    @State var liters: Double

    @State private var stepperValue: Double = 0.0
    
    
    var body: some View {
        VStack {
            Text("Today's Water Intake")
                .font(.callout)
                .foregroundColor(Color(.darkGrey))
                .padding(.trailing, 180.0)
            
            Text("\(stepperValue, specifier: "%.1f") Liter / \(liters, specifier: "%.1f") liters")
                .font(.title)
                .foregroundColor(Color(.black1))
                .fontWeight(.bold)
                .padding(.trailing, 109.0)
            
            CircleProgressBar(value: $stepperValue,liters: liters)
                .frame(width: 300, height: 300)
                .padding(.top, 73.0)
            
            CustomStepper(value: $stepperValue, in: 0...liters, step: 0.1) {
                Text(" \(stepperValue, specifier: "%.1f")")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(60)
            }
        }
    }
}

struct CircleProgressBar: View {
    
    @Binding var value: Double
    @State var liters: Double

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 40)
                .foregroundColor(Color(.lightBlue))
                .opacity(0.3)

            Circle()
                .trim(from: 0.0, to: value / liters)
                .stroke(style: StrokeStyle(lineWidth: 40, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(.darkBlue))
                .rotationEffect(Angle(degrees: -90))
                .animation(.easeInOut(duration: 0.1))

            Emoji(text: "😴", appearTime: 0.1, disappearTime: 0.1, progressValue: $value)
                .offset(x: 0, y: -149)

            Emoji(text: "😃", appearTime: 0.7, disappearTime: 0.7, progressValue: $value)
                .offset(x: 150, y: 10)

            Emoji(text: "😁", appearTime: 1.3, disappearTime: 1.3, progressValue: $value)
                .offset(x: 0, y: 149)

            Emoji(text: "😍", appearTime: 1.9, disappearTime: 2.0, progressValue: $value)
                .offset(x: -148, y: 30)

            Emoji(text: "🥳", appearTime: liters, disappearTime: liters, progressValue: $value)
                .offset(x: 0, y: 0)
        }

    }

}

struct Emoji: View {
    var text: String
    var appearTime: Double
    var disappearTime: Double
    @Binding var progressValue: Double

    @State private var isVisible: Bool = false

    var body: some View {
        Text(text)
            .font(.system(size: 40))
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + appearTime) {
                    isVisible = true
                }
            }
            .onDisappear {
                DispatchQueue.main.asyncAfter(deadline: .now() + disappearTime) {
                    isVisible = false
                }
            }
            .opacity(isVisible && progressValue >= appearTime && progressValue <= disappearTime ? 1 : 0)
            .animation(.easeIn(duration: 0.2))
    }
}

struct CustomStepper<Label>: View where Label: View {
    @Binding var value: Double
    var `in`: ClosedRange<Double>
    var step: Double
    var label: () -> Label

    var body: some View {
        HStack(spacing: 10) {
            Button(action: decrease) {
                Image(systemName: "minus")
                    .font(.title)
                    .foregroundColor(Color(.darkBlue))
                    .padding(20)
                    .background(Circle().frame(width: 50, height: 50).foregroundColor(Color(.lightherGrey)))
            }
            .disabled(value <= `in`.lowerBound)

            label()

            Button(action: increase) {
                Image(systemName: "plus")
                    .font(.title2)
                    .foregroundColor(Color(.darkBlue))
                    .padding(20)
                    .background(Circle().frame(width: 50, height: 50).foregroundColor(Color(.lightherGrey)))
            }
            .disabled(value >= `in`.upperBound)
        }
    }

    private func decrease() {
        let newValue = max(`in`.lowerBound, value - step)
        value = newValue
    }

    private func increase() {
        let newValue = min(`in`.upperBound, value + step)
        value = newValue
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LiterView(liters: 2.5)
    }
}

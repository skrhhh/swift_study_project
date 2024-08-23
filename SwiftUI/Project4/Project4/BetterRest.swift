//
//  BetterRest.swift
//  Project4
//
//  Created by admin on 2024/8/23.
//

import Foundation
import SwiftUI
import CoreML
struct BetterRest: View {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @State private var wakeUp = defaultWakeTime
    @State private var sleepTime: Date = .now
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?\n几点起床?") {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .onChange(of: wakeUp) {
                            calculateBedtime()
                        }
                    
                }
                VStack (spacing: 0){
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Text("所需的睡眠时间")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25){ status in
                        calculateBedtime()
                    }
                        
                }
                Section("Daily coffee intake\n每日咖啡摄入量") {
                    Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20){ status in
                        calculateBedtime()
                    }
                }
                
                VStack {
                    Text("Your ideal bedtime is…\n您理想的就寝时间是……")
                    Text(sleepTime.formatted(date: .omitted, time: .shortened))
                        .fontWeight(.bold)
                        .font(.system(size: 55))
                }
                
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate"){
                    calculateBedtime()
                    showingAlert = true
                }
            }
        }
        
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            
            sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is…\n您理想的就寝时间是……"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            // more code here
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
    }
}

#Preview {
    BetterRest()
}

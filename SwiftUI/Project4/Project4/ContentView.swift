//
//  ContentView.swift
//  Project4
//
//  Created by admin on 2024/8/22.
//

import SwiftUI

struct ContentView: View {
    @State var sleepAmount: Double = 8
    @State private var wakeUp = Date.now
    private var tomorrow: Date {
        Date.now.addingTimeInterval(86400)
    }
    
    private var specificTime: Date {
        let components = DateComponents(hour: 8, minute: 0)
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        VStack {
            Stepper("\(sleepAmount) hours", value: $sleepAmount)
            Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 4...12)
            Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            
            DatePicker("enter a date", selection: $wakeUp)
            DatePicker("", selection: $wakeUp)
            DatePicker("enter a date", selection: $wakeUp)
                .labelsHidden()
            DatePicker("enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
            
            DatePicker("enter a date", selection: $wakeUp, in: Date.now...tomorrow, displayedComponents: .hourAndMinute)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

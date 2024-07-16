//
//  ContentView.swift
//  Challenge1
//
//  Created by admin on 2024/7/16.
//

import SwiftUI

struct ContentView: View {
    let units = ["S", "M", "H", "D", "Y"]
    
    @State private var enterValue: Double = 0
    @State private var enterUnit = "S"
    @State private var resultUnit = "S"
    
    var conversionFactors: [String: Double] {
        return [
            "S": 1,
            "M": 60,
            "H": 3600,
            "D": 86400,
            "Y": 31536000
        ]
    }
    
    var resultValue: Double {
        let enterFactor = conversionFactors[enterUnit] ?? 1
        let resultFactor = conversionFactors[resultUnit] ?? 1
        let baseValueInSeconds = enterValue * enterFactor
        return baseValueInSeconds / resultFactor
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Select the unit you entered") {
                    Picker("Unit", selection: $enterUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section("Select the unit you want to convert") {
                    Picker("Unit", selection: $resultUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section("Input conversion value") {
                    TextField("Value", value: $enterValue, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section("Result") {
                    Text("\(resultValue, specifier: "%.2f")")
                }
            }
            .navigationTitle("TRANSFER TOOL")
        }
    }
}

#Preview {
    ContentView()
}

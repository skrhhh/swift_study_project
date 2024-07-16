//
//  ContentView.swift
//  Project1
//
//  Created by admin on 2024/7/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        return checkAmount + tipValue
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let totalAmount = checkAmount + tipValue
        let amountPerPerson = totalAmount / peopleCount

        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
                
                Section("How much tip do you want to leave?") {
//                    Text("How much tip do you want to leave?")
                    
//                    Picker("Tip percentage", selection: $tipPercentage) {
//                        ForEach(tipPercentages, id: \.self) {
//                            Text($0, format: .percent)
//                        }
//                    }
//                    .pickerStyle(.segmented)
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0...100, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Picker("Number of perple", selection: $numberOfPeople) {
                    ForEach(2..<100){
                        Text("\($0) people")
                    }
                }
                .pickerStyle(.navigationLink)
                
                Section("Total Amount") {
                    Text(totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }

        }
    }
}

//struct ContentView: View {
//    @State private var tapCount = 0
//    @State private var name = ""
//
//    let students = ["A", "B", "C"]
//    @State private var selectedStudent = "A"
//
//    var body: some View {
//        NavigationStack {
//            Form {
//                Picker("Select your student", selection: $selectedStudent) {
//                    ForEach(students, id: \.self) {
//                        Text($0)
//                    }
//                }
//            }
//
//            Form {
//                Section {
//                    ForEach(0..<2) { num in
//                        Text("Row \(num)")
//                    }
//                }
//                Section {
//                    ForEach(0..<2) {
//                        Text("\($0)")
//                    }
//                }
//            }
//
//            Form {
//                TextField("Enter your name", text: $name)
//                Text("AAA")
//                Text(name)
//            }
//            Form {
//                Section {
//                    Text("A")
//                    Text("B")
//                }
//                Section {
//                    Text("C")
//                }
//            }
//            Button("Tap Count: \(tapCount)") {
//                tapCount += 1
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//
//    }
//}

#Preview {
    ContentView()
}

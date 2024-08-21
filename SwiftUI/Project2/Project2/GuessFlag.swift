//
//  GuessFlag.swift
//  Project2
//
//  Created by admin on 2024/8/21.
//

import Foundation
import SwiftUI
struct GuessFlag: View{
    @State var score: Int = 0
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var chooseCountry = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            
            VStack(spacing: 15) {
                Spacer()
                Text("Guess Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    
                    
                    Text(countries[chooseCountry])
                        .font(.largeTitle.weight(.semibold))
                }
                
                ForEach(0..<3) { number in
                    Button {
                        clickAnswer(number)
                    } label: {
                        Image(countries[number])
                            .clipShape(.capsule)
                            .shadow(radius: 5)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text(alertTitle),
                            message: Text(alertMessage(for: number)),
                            dismissButton: .default(Text("Continue")) {
                                continueGame()
                            }
                        )
                    }
                    
                }
                Spacer()
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))

        }
        
        
    }
    
    
    func clickAnswer(_ number: Int){
        if number == chooseCountry {
            alertTitle = "Correct"
            score += 1
        } else {
            alertTitle = "Wrong"
            score -= 1
        }
        
        showAlert = true
    }
    
    func continueGame(){
        countries.shuffle()
        chooseCountry = Int.random(in: 0...2)
    }
    
    func alertMessage(for index: Int) -> String {
        if alertTitle == "Wrong" {
            return "Your Score is \(score).\nThat's the flag of \(countries[index])."
        } else {
            return "Your Score is \(score)."
        }
    }
    
}

#Preview {
    GuessFlag()
}

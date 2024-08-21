//
//  ContentView.swift
//  Project2
//
//  Created by admin on 2024/7/26.
//

import SwiftUI

struct ContentView: View {
    @State var showingAlert: Bool = false
    var body: some View {
        ZStack {
            VStack (spacing: 0){
                Color.red
                Color.blue
            }
            Text("content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
            Color.blue
            LinearGradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)
            LinearGradient(stops: [
                Gradient.Stop(color: .white, location: 0.45),
                Gradient.Stop(color: .black, location: 0.55),
                .init(color: .blue, location: 0.65)
            ], startPoint: .top, endPoint: .bottom)
            RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center,startAngle: Angle(radians: 0), endAngle: Angle(radians: .pi * 2))
            
            Text("content")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                .font(.system(size: 100))
                .background(.red.gradient)
            Color.white
            Button("Delete", role: .destructive, action: clickDelete)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.red)
                .font(.system(size: 100))
                .foregroundColor(.blue)
            Color.white
            VStack {
                Button("Button 1") { }
                    .buttonStyle(.bordered)
                Button("Button 2", role: .destructive) { }
                    .buttonStyle(.bordered)
                Button("Button 3") { }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                Button("Button 4", role: .destructive) { }
                    .buttonStyle(.borderedProminent)
                Button {
                    
                } label: {
                    Text("1")
                }
                Button {
                    
                }label: {
                    Image(systemName: "pencil")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50,height: 50)
                        
                        
                }
                .frame(width: 100,height: 100)
                
                Button("show Alert"){
                    showingAlert = true
                }
                .alert("alert",isPresented: $showingAlert){
                    Button("Delete", role: .destructive) { }
                        Button("Cancel", role: .cancel) { }
                } message: {
                    Text("ssss")
                }
                
            }
                
        }
        .ignoresSafeArea()
    }
    
    func clickDelete() {
        print("click Delete")
    }
}

#Preview {
    ContentView()
}

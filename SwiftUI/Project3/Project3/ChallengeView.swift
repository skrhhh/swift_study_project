//
//  ChallengeView.swift
//  Project3
//
//  Created by admin on 2024/8/22.
//

import Foundation
import SwiftUI

struct ChallengeView: View {
    @State var switchStatus = false
    
    var body: some View {
        VStack{
            Text("Show Text")
                .foregroundStyle(switchStatus ? .blue : .black)
            FlagImage(title: "pencil")
            Button("click"){
                switchStatus = !switchStatus
            }
        }
        .prominentTitle()
        
    }
}

struct FlagImage: View {
    var title: String = "pencil"
    
    var body: some View {
        Image(systemName: title)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 100, maxHeight: 100)
    }
}

#Preview {
    ChallengeView()
}

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 34, weight: .bold, design: .default))
            .foregroundColor(.blue)
    }
}

extension View {
    func prominentTitle() -> some View{
        modifier(ProminentTitle())
    }
}

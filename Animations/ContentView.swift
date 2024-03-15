//
//  ContentView.swift
//  Animations
//
//  Created by Wes MacDonald on 3/14/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.smooth) {
                animationAmount += 80
            }
        }
        .padding(40)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0.0, y: 0.0, z: 1.0))
        // animation with binding animation:
//        return VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
//            
//            Spacer()
//            
//            Button("Tap Me") {
//                animationAmount += 1
//            }
//            .padding(40)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            .scaleEffect(animationAmount)
//        }
        
        // animated button with implicit animations:
//        Button("Tap Me!") {
////            animationAmount += 1
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundStyle(.white)
//        .clipShape(.circle)
//        .overlay(
//            Circle()
//                .stroke(.red)
//                .scaleEffect(animationAmount)
//                .opacity(2 - animationAmount)
//                .animation(
//                    .easeOut(duration: 1)
//                        .repeatForever(autoreverses: false),
//                    value: animationAmount
//                )
//        )
//        .onAppear {
//            animationAmount = 2
//        }
    }
}

#Preview {
    ContentView()
}

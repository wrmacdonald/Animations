//
//  ContentView.swift
//  Animations
//
//  Created by Wes MacDonald on 3/14/24.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    // Ideas: background, text, button
    @State private var enlarge = false
    @State private var opaque = false
    
    @State private var isShowingRed = false
    
//    @State private var isShowingRed = false
    
//    let letters = Array("Hello SwiftUI")
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
    
//    @State private var dragAmount = CGSize.zero
    
//    @State private var enabled = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
        
        Text("Hello World")
            .font(enlarge ? .title : .title2)
            .opacity(opaque ? 0.2 : 1)
            .onAppear(perform: pulsateText)
            .onTapGesture {
                withAnimation(Animation.easeIn) { enlarge.toggle() }
            }
        
//        VStack {
//            Button("Tap Me") {
//                withAnimation {
//                    isShowingRed.toggle()
//                }
//            }
//            
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
//        }
        
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count, id: \.self) { num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { dragAmount = $0.translation }
//                .onEnded { _ in
//                    dragAmount = .zero
//                    enabled.toggle()
//                }
//        )
        
//        LinearGradient(
//            colors: [.yellow, .red],
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing
//        )
//        .frame(width: 300, height: 200)
//        .clipShape(.rect(cornerRadius: 10))
//        .offset(dragAmount)
//        .gesture(
//            DragGesture()
//                .onChanged { dragAmount = $0.translation }
//                .onEnded { _ in
//                    withAnimation(.bouncy) {    // explicit animation just on ending
//                        dragAmount = .zero
//                    }
//                }
//        )
////        .animation(.bouncy, value: dragAmount)      // implicit animation
            
        
//        Button("Tap Me") {
//            enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? .blue : .red)
//        .foregroundStyle(.white)
////        .animation(.default, value: enabled)
//        .animation(nil, value: enabled)         // don't animate anything above this point
//        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
//        .animation(.spring(duration: 1, bounce: 0.9), value: enabled)
    }
    
    private func pulsateText() {
        withAnimation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true)) {
            opaque.toggle()
        }
    }
}

#Preview {
    ContentView()
}

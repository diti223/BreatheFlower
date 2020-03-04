//
//  ContentView.swift
//  Breathe
//
//  Created by Adrian-Dieter Bilescu on 3/4/20.
//  Copyright © 2020 Bilescu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Flower()
    }
}

struct Flower: View {
    var scale: CGFloat {
        isOpen ? 0.35 : 0.05
    }
    
    var opacity: Double {
        isOpen ? 0.95 : 0.15
    }
    
    var anchor: UnitPoint {
        isOpen ? .center : .bottom
    }
    @State var isOpen = false
    var body: some View {
        ZStack {
            ForEach(0..<6) { index in
                OneCircle(opacity: self.opacity)
                    .rotationEffect(.init(degrees: 60 * Double(index)), anchor: self.anchor)
            }
        }
        .scaledToFit()
        .scaleEffect(scale)
        .onAppear() {
            withAnimation(Animation.easeInOut(duration: 3.0).repeatForever()) {
                self.isOpen.toggle()
            }
            
        }
    }
}

struct OneCircle: View {
    var opacity: Double = 1.0
    var body: some View {
        Circle()
            .foregroundColor(.breath)
            .opacity(opacity)
        
    }
}

extension Color {
    static var breath: Color {
        .init(red: 0, green: 0.647, blue:  0.95)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

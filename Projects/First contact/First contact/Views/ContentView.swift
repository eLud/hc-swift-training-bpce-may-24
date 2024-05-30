//
//  ContentView.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 29/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .backgroungWithRadius(color: .red, radius: 20)
            Text("Test")
                .backgroungWithRadius(color: .blue, radius: 8)
                .bold()
            Image(systemName: "leaf")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .border(.black)
                .bold()
        }
        .backgroungWithRadius(color: .green, radius: 15)
    }
}

extension View {
    func backgroungWithRadius(color: Color, radius: CGFloat) -> some View {
        modifier(BackgroundWithRadius(color: color, radius: radius))
    }

    func smallModal(isPresented: Binding<Bool>, height: Double) -> some View {
        modifier(SmallModal(isPresented: isPresented, height: height))
    }
}

struct BackgroundWithRadius: ViewModifier {

    let color: Color
    let radius: Double

    func body(content: Content) -> some View {
        content
            .padding()
            .background {
                color
            }
            .clipShape(RoundedRectangle(cornerRadius: radius))
    }
}

struct SmallModal: ViewModifier {

    @Binding var isPresented: Bool
    let height: Double

    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
                .scaleEffect(isPresented ? 0.95 : 1)
            if isPresented {
                Rectangle()
                    .ignoresSafeArea(edges: .bottom)
                    .frame(height: height)
                    .transition(.move(edge: .bottom))
                    .zIndex(100)
            }
        }
        .animation(.spring, value: isPresented)
    }
}

#Preview {
    ContentView()
}

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
        self
            .padding()
            .background {
                color
            }
            .clipShape(RoundedRectangle(cornerRadius: radius))
    }
}

#Preview {
    ContentView()
}

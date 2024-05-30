//
//  TransitionExample.swift
//  Animations and transitions
//
//  Created by Ludovic Ollagnier on 03/10/2022.
//

import SwiftUI

struct TransitionExample: View {
    @State private var isTop = true

    var body: some View {
        VStack {
            if isTop {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.green)
                    .frame(width: 250, height: 250)
                    .offset(y: -250)
                    .transition(.opacity.animation(.easeInOut))
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.red)
                    .frame(width: 250, height: 250)
                    .offset(y: 250)
                    .transition(.opacity.animation(.easeInOut))
            }
        }.frame(width: 400, height: 800)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2).foregroundColor(.white))
        .onTapGesture {
            isTop.toggle()
        }
    }
}

struct TransitionExample_Previews: PreviewProvider {
    static var previews: some View {
        TransitionExample()
    }
}

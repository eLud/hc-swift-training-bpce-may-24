//
//  AnimationExample.swift
//  Animations and transitions
//
//  Created by Ludovic Ollagnier on 03/10/2022.
//

import SwiftUI

struct AnimationExample: View {

    @State private var isTop = true

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(isTop ? .green : .red)
                .frame(width: 250, height: 250)
                .offset(y: isTop ? -250 : 250)
                .animation(.easeInOut, value: isTop)

        }.frame(width: 400, height: 800)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2).foregroundColor(.white))
        .onTapGesture {
            isTop.toggle()
        }
    }
}

struct AnimationExample_Previews: PreviewProvider {
    static var previews: some View {
        AnimationExample()
    }
}

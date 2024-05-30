//
//  MatchedGeometryExample.swift
//  Animations and transitions
//
//  Created by Ludovic Ollagnier on 04/10/2022.
//

import SwiftUI

struct MatchedGeometryExample: View {
    @State private var isTop = true
    @Namespace private var anim

    var body: some View {
        VStack {
            if isTop {
                Text("This is some title")
                    .foregroundColor(.green)
                    .offset(y: 100)
                    .matchedGeometryEffect(id: "title", in: anim)
            }
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(isTop ? .green : .red)
                .frame(width: 250, height: 250)
                .offset(y: isTop ? -250 : 250)
                .animation(.easeInOut, value: isTop)
            if !isTop {
                Text("This is some title")
                    .foregroundColor(.red)
                    .offset(y: -100)
                    .matchedGeometryEffect(id: "title", in: anim)
            }
        }.frame(width: 400, height: 800)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2).foregroundColor(.white))
        .onTapGesture {
            withAnimation {
                isTop.toggle()
            }
        }
    }
}

struct MatchedGeometryExample_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryExample()
    }
}

//
//  IdentityExample.swift
//  Animations and transitions
//
//  Created by Ludovic Ollagnier on 03/10/2022.
//

import SwiftUI

struct IdentityExample: View {

    var offset: Double
    var color: Color

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(color)
                .frame(width: 250, height: 250)
                .offset(y: offset)
        }.frame(width: 400, height: 800)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2)).foregroundColor(.white)
    }
}

struct IdentityExample_Previews: PreviewProvider {
    static var previews: some View {
        IdentityExample(offset: 200, color: .green)
    }
}

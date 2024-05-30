//
//  ImagedToggle.swift
//  MoveUI
//
//  Created by Ludovic Ollagnier on 16/05/2024.
//

import SwiftUI

struct ImagedToggle: View {

    @Binding var isOn: Bool

    var body: some View {
        ZStack(alignment: isOn ? .trailing : .leading) {
            background
            thumb
        }
        .frame(width: 50, height: 30)
        .onTapGesture {
            withAnimation {
                isOn.toggle()
            }
        }
    }

    private var background: some View {
        Capsule()
            .foregroundStyle(isOn ? .green : .gray)
    }

    private var thumb: some View {
        Circle()
            .foregroundStyle(.white)
            .padding(2)
            .overlay {
                Image(systemName: "dollarsign")
                    .opacity(isOn ? 1 : 0)
            }
            .animation(.bouncy(duration: 0.4, extraBounce: 0.1), value: isOn)
    }
}

#Preview {
    ImagedToggle(isOn: .constant(true))
}

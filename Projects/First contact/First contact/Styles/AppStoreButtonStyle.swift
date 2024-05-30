//
//  AppStoreButtonStyle.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 29/05/2024.
//

import SwiftUI

struct AppStoreButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.semibold)
            .font(.callout)
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background {
                Capsule()
                    .foregroundStyle(configuration.isPressed ? color(for: configuration.role).opacity(0.8) : color(for: configuration.role))
            }
    }

    private func color(for role: ButtonRole?) -> Color {
        if let role, role == .destructive {
            return .red
        } else {
            return .blue
        }
    }
}

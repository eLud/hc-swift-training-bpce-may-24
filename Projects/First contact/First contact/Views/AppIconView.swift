//
//  AppIconView.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 30/05/2024.
//

import SwiftUI

struct AppIconView: View {

    let iconName: String
    var radius = 20.0

    var body: some View {
        RoundedRectangle(cornerRadius: radius, style: .continuous)
            .foregroundStyle(.gray)
            .overlay {
                Image(systemName: iconName)
                    .resizable()
                    .padding()
            }    }
}

#Preview {
    AppIconView(iconName: "leaf")
        .frame(width: 128, height: 128)
}

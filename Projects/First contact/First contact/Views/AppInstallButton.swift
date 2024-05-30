//
//  AppInstallButton.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 30/05/2024.
//

import SwiftUI

struct AppInstallButton: View {

    let app: Application

    @Environment(\.locale) var locale
    @Environment(AppData.self) var data: AppData

    var body: some View {
        Button(action: {
            data.install(app: app)
        }) {
            if data.isAppInstalled(app) {
                Image(systemName: "icloud.and.arrow.down")
                    .padding(.horizontal)
            } else {
                buttonText
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .frame(width: 50)
            }
        }
        .buttonStyle(AppStoreButtonStyle())
    }

    @ViewBuilder
    private var buttonText: some View {
        if let price = app.price {
            Text(price, format: .currency(code: locale.currency?.identifier ?? "EUR"))
        } else {
            Text("Obtenir")
        }
    }
}

#Preview {
    AppInstallButton(app: Application.demoApps.first!)
}

#Preview {
    AppInstallButton(app: Application.demoApps.last!)
}

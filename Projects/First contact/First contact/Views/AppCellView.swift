//
//  AppCellView.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 30/05/2024.
//

import SwiftUI

struct AppCellView: View {

    let app: Application

    var body: some View {
        HStack {
            AppIconView(iconName: app.appIconName, radius: 8)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(app.name)
                Text(app.developerName)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            VStack {
                AppInstallButton(app: app)
                if app.hasInAppPurchase {
                    Text("Achats intégrés")
                        .font(.system(size: 8))
                        .fontWeight(.light)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    AppCellView(app: Application.demoApps.first!)
}

#Preview {
    AppCellView(app: Application.demoApps.first!)
}

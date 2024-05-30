//
//  SettingsView.swift
//  Navigation
//
//  Created by Ludovic Ollagnier on 16/05/2024.
//

import SwiftUI

struct SettingsView: View {

    @Environment(Router.self) private var router

    var body: some View {
        Form {
            Button("Account") {
                router.navigateToAccount()
            }

            Button("Back to home") {
                router.popToRoot()
            }
        }
    }
}

#Preview {
    SettingsView()
}

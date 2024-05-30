//
//  NavigationApp.swift
//  Navigation
//
//  Created by Ludovic Ollagnier on 16/05/2024.
//

import SwiftUI

// @State: Indique une variable utilisée comme source de vérité (private, avec valeur initiale). Peut être modifié par la vue elle même, ou ses enfants
// @Binding (value type only): Indique une variable qui utilise une source de vérité "externe" (@State dans un parent) en communication bi-directionnelle. Si pas de modifification dans la vue, une variable simple suffit.
// @Bindable: Permet de rajouter des Bindings pour les propriétés dans un objet observable (class). Utile si on a besoin d'un binding vers une des propriétés de la classe.
// @Environment: Récupère un objet stocké dans l'environnement

@main
struct NavigationApp: App {

    @State private var router = Router()
    @State private var appData = AppData()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationStack(path: $router.navPath) {
                    ProductListView()
                        .navigationDestination(for: Screens.self) { screen in
                            switch screen {
                            case .account:
                                Text("Account")
                            case .settings:
                                SettingsView()
                            case .product(let p):
                                ProductView(product: p)
                            }
                        }
                }
                BasketView(router: router, data: appData, text: $appData.text)
            }
            .environment(router)
            .environment(appData)
        }
    }
}

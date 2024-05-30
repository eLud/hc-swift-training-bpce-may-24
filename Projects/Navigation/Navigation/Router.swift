//
//  Router.swift
//  Navigation
//
//  Created by Ludovic Ollagnier on 16/05/2024.
//

import Foundation

enum Screens: Hashable {
    case settings
    case product(Product) // valeur associée
    case account
}

@Observable
class Router {

    var navPath: [Screens] = []

    func navigateToAccount() {
        navPath.append(.account)
    }

    func navigateToSettings() {
        navPath.append(.settings)
    }

    func navigateTo(_ product: Product) {
        navPath.append(.product(product))
    }

    func popToRoot() {
        navPath.removeAll()
    }
}

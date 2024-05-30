//
//  Application.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 30/05/2024.
//

import Foundation

struct Application: Identifiable, Hashable {

    let id = UUID()
    let name: String
    let appIconName: String
    let developerName: String

    let price: Double?
    let hasInAppPurchase: Bool

    static var demoApps: [Application] {
        [Application(name: "Duolingo", appIconName: "eyes", developerName: "Duolingo", price: nil, hasInAppPurchase: true),
         Application(name: "Procreate Pocket", appIconName: "pencil.and.scribble", developerName: "Savage Interactive", price: 6.99, hasInAppPurchase: false),
         Application(name: "Filca - SLR Film Camera", appIconName: "camera", developerName: "Cheol Kim", price: 1.99, hasInAppPurchase: true),
         Application(name: "Monopoly Go!", appIconName: "banknote", developerName: "Scopely", price: nil, hasInAppPurchase: true)
        ]
    }
}

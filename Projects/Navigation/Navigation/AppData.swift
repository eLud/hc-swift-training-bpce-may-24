//
//  AppData.swift
//  Navigation
//
//  Created by Ludovic Ollagnier on 16/05/2024.
//

import Foundation

@Observable
class AppData {

    private(set) var products: [Product]
    var text: String

    init(products: [Product] = [Product(name: "Demo Product")]) {
        self.products = products
        text = "Hello"
    }

    func addProduct(_ product: Product) {
        products.append(product)
    }

    func relatedProducts(for product: Product) -> [Product] {
        var related: Set<Product> = []
        let max = min(products.count, 5)
        for p in 0..<max {
            guard let p = products.randomElement() else { return [] }
            related.insert(p)
        }
        related.remove(product)
        return related.sorted {
            $0.name < $1.name
        }
    }
}

struct Product: Identifiable, Hashable {
    let id = UUID()
    let name: String

    static var random: Product {
        Product(name: "Product \(UUID().uuidString)")
    }
}

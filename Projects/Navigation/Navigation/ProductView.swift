//
//  ProductView.swift
//  Navigation
//
//  Created by Ludovic Ollagnier on 16/05/2024.
//

import SwiftUI

struct ProductView: View {

    let product: Product
    
    @Environment(AppData.self) private var data
    @Environment(Router.self) private var router

    var body: some View {
        Form {
            Text(product.name)
                .font(.title)
            Section {
                ForEach(data.relatedProducts(for: product)) { p in
                    NavigationLink(value: Screens.product(p)) {
                        Text(p.name)
                    }
                }
            } header: {
                Text("Related")
            }
        }
        .navigationTitle(product.name)
        .toolbar {
            ToolbarItem {
                Button(action: {
                    router.navigateToSettings()
                }, label: {
                    Image(systemName: "gearshape")
                })
            }
        }
    }
}

#Preview {
    ProductView(product: .random)
}

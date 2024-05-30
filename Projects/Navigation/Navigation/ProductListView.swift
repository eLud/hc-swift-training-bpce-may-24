//
//  ContentView.swift
//  Navigation
//
//  Created by Ludovic Ollagnier on 16/05/2024.
//

import SwiftUI

struct ProductListView: View {

    @Environment(Router.self) private var router
    @Environment(AppData.self) private var data

    @State private var showSheet = true

    var body: some View {
        List(data.products) { product in
            NavigationLink {
                ProductView(product: product)
            } label: {
                Text(product.name)
            }
        }
        .sheet(isPresented: $showSheet, content: {
            Text("Je suis dans une sheet")
        })
        .navigationTitle("Products")
        .toolbar {
            ToolbarItem {
                Button(action: {
                    data.addProduct(.random)
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }
    }
}

#Preview {
    ProductListView()
        .environment(Router())
}

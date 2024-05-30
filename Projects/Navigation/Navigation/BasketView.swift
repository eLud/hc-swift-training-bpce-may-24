//
//  BasketView.swift
//  Navigation
//
//  Created by Ludovic Ollagnier on 17/05/2024.
//

import SwiftUI

struct BasketView: View {

    var router: Router
    var data: AppData
    @Binding var text: String

    @AppStorage("laClé") var maVariable = "valeur par défaut"

    @State var isDisplayed = false

    var body: some View {
        VStack {
            TextField("Name", text: $text)
            TextField("Persisté", text: $maVariable)
            Button("Toggle") {
                isDisplayed.toggle()
                maVariable = "Bouton"
            }
        }
    }
}

#Preview {
    BasketView(router: Router(), data: AppData(), text: .constant(""))
}

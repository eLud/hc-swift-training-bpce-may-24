//
//  AppStoreInfoView.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 29/05/2024.
//

import SwiftUI

struct AppStoreInfoView<M, B>: View where B: View, M: View{

    let topText: String
    let middleImageSystemName: ()->(M)
    let bottomText: ()->(B)

    var body: some View {
        VStack(spacing: 8) {
            Text(topText.uppercased())
                .font(.caption2)
                .bold()
            middleImageSystemName()
            bottomText()
        }
        .foregroundStyle(.gray)
        .frame(width: 70)
    }
}

#Preview {
    AppStoreInfoView(topText: "Catégorie", middleImageSystemName: {Image(systemName:"person.crop.square")}, bottomText: {Text("Dev Name")})
}

//
//  AppStoreInfoView.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 29/05/2024.
//

import SwiftUI

struct AppStoreInfoView<M, B>: View where B: View, M: View {

    let topText: String
    let middle: ()->(M)
    let bottom: ()->(B)
    let onTapAction: ()->()

    var body: some View {
        VStack(spacing: 8) {
            Text(topText.uppercased())
                .font(.caption2)
                .bold()
            middle()
            bottom()
        }
        .foregroundStyle(.gray)
        .frame(width: 70)
        .onTapGesture {
            onTapAction()
        }
    }
}

#Preview {
    AppStoreInfoView(topText: "Catégorie", middle: {Image(systemName:"person.crop.square")}, bottom: {Text("Dev Name")}, onTapAction: {  })
}

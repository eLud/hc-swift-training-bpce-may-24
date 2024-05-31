//
//  WebBrowserView.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 31/05/2024.
//

import SwiftUI

struct WebBrowserView: View {

    @State var url = URL(string: "https://developer.apple.com/")!
    @State var isLoading = false

    var body: some View {
        VStack {
            Text(isLoading ? "Loading…" : "")
            Button("Navigate") {
                let newURL = [URL(string: "https://developer.apple.com/")!,
                 URL(string: "https://developer.apple.com/documentation/swiftui/uikit-integration")!,
                 URL(string: "https://developer.apple.com/documentation/swiftui/uiviewrepresentable")!
                ].randomElement()

                guard let newURL else { return }
                url = newURL
            }
            WebView(url: url, isLoading: $isLoading)
        }
    }
}

#Preview {
    WebBrowserView()
}

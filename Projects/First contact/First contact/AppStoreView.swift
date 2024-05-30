//
//  AppStoreView.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 29/05/2024.
//

import SwiftUI

struct AppStoreView: View {

    let appName: String
    let editorName: String

    @State private var shouldDivide = true

    var body: some View {
        ScrollView {
            VStack {
                fullHeader
                Toggle("Should divide", isOn: $shouldDivide)
                ImagedToggle(isOn: $shouldDivide)
                dividerIfNeeded
                scrollingInfoView
                scrollingImages
            }
        }
        .ignoresSafeArea()
    }

    @ViewBuilder
    private var fullHeader: some View {
        header
        subHeader
    }

    @ViewBuilder
    private var dividerIfNeeded: some View {
        if shouldDivide {
            Divider()
        }
    }

    private var header: some View {
        Rectangle()
            .foregroundStyle(.green)
            .frame(height: 200)
            .overlay {
                Text(appName)
                    .font(.largeTitle)
                    .bold()
            }
    }

    private var subHeader: some View {
        HStack(spacing: 16) {
            appIcon
            VStack(alignment: .leading) {
                Text(appName)
                    .font(.title)
                    .fontWeight(.medium)
                Text(editorName)
                    .font(.callout)
                    .foregroundStyle(.gray)
                HStack {
                    getAppButton
                    Text("Achat intégré")
                        .font(.caption2)
                        .foregroundStyle(.gray)
                    Spacer()
                    Button(action: {
                        shouldDivide.toggle()
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                }
                .padding(.top, 20)
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
    }

    private var appIcon: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .foregroundStyle(.gray)
            .frame(width: 128, height: 128)
            .overlay {
                Image(systemName: "questionmark.app")
                    .imageScale(.large)
            }
    }

    private var getAppButton: some View {
        Button("Obtenir") { }
            .buttonStyle(AppStoreButtonStyle())
    }

    private var scrollingInfoView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<5) { i in
                    AppStoreInfoView(topText: "Test \(i)", middle: {
                        Image(systemName:"person.crop.square")
                    }, bottom: {
                        Text("Dev Name")
                            .font(.caption2)
                    }, onTapAction: {
                        print("tapped on \(i)")
                    })
                    Divider()
                }
            }
        }
        .padding(.leading, 8)
        .frame(height: 80)
    }

    private var scrollingImages: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<5) { i in
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 300, height: 500)
                }
            }
            .padding(.horizontal)
        }
    }
}

extension View {
    func appStoreButtonStyle() -> some View {
        self
            .fontWeight(.semibold)
            .font(.callout)
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background {
                Capsule()
                    .foregroundStyle(.blue)
            }
    }
}

#Preview {
    AppStoreView(appName: "Duolingo", editorName: "Duolingo")
}

#Preview {
    AppStoreView(appName: "Duolingo", editorName: "Duolingo")
        .preferredColorScheme(.dark)
}

#Preview {
    AppStoreView(appName: "DuolingoDuolingoDuolingo", editorName: "Duolingo")
}

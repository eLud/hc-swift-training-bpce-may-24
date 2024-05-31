//
//  AppStoreView.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 29/05/2024.
//

import SwiftUI

struct AppStoreView: View {

    let app: Application
    let shouldDivide = true

    @Environment(AppData.self) var data

    var body: some View {
        ScrollView {
            VStack {
                fullHeader
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
                Text(app.name)
                    .font(.largeTitle)
                    .bold()
            }
    }

    private var subHeader: some View {
        HStack(spacing: 16) {
            appIcon
            VStack(alignment: .leading) {
                Text(app.name)
                    .font(.title)
                    .fontWeight(.medium)
                Text(app.developerName)
                    .font(.callout)
                    .foregroundStyle(.gray)
                HStack {
                    getAppButton
                    if app.hasInAppPurchase {
                        Text("Achat intégré")
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    Button(action: {
                        data.todayPath.append(contentsOf: [Application.demoApps.first!, Application.demoApps.last!])
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

    @GestureState private var appIconRotation = Angle(degrees: 0)
    @GestureState private var translation = CGSize.zero

    private var appIcon: some View {
        AppIconView(iconName: app.appIconName)
            .frame(width: 128, height: 128)
            .rotationEffect(appIconRotation)
            .offset(translation)
            .gesture(iconDragGesture)
            .simultaneousGesture(iconRotationGesture)
    }

    private var iconRotationGesture: some Gesture {
        RotateGesture()
            .updating($appIconRotation) { value, rotation, transaction in
                rotation = value.rotation
            }
    }

    private var iconDragGesture: some Gesture {
        DragGesture()
            .updating($translation) { value, translation, transaction in
                translation = value.translation
            }
    }

    private var getAppButton: some View {
        Button("Obtenir") {}
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
    AppStoreView(app: Application.demoApps.first!)
        .environment(AppData(applications: Application.demoApps))
}

#Preview {
    AppStoreView(app: Application.demoApps.first!)
        .preferredColorScheme(.dark)
        .environment(AppData(applications: Application.demoApps))
}

#Preview {
    AppStoreView(app: Application.demoApps.last!)
        .environment(AppData(applications: Application.demoApps))
}

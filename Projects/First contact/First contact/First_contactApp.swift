//
//  First_contactApp.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 29/05/2024.
//

import SwiftUI

@main
struct First_contactApp: App {

    //Old way before iOS 17
//    @StateObject private var data = AppData(applications: [])

    @State private var data: AppData = AppData(applications: Application.demoApps)

    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            macOS
                .environment(data)
                .sheet(isPresented: $data.showGlobalAlert, content: {
                    Text("Global Alert")
                })
            #else
            iPhone
                .environment(data)
                .sheet(isPresented: $data.showGlobalAlert, content: {
                    Text("Global Alert")
                })
            #endif
        }
    }



    private var iPhone: some View {
        TabView {
            NavigationStack(path: $data.todayPath) {
                ApplicationListView()
                    .navigationDestination(for: Application.self) { app in
                        AppStoreView(app: app)
                    }
            }
            .tabItem {
                Label("Aujourd'hui", systemImage: "list.bullet.rectangle.portrait")
            }
            NavigationStack {
                ApplicationListView()
            }
            .tabItem {
                Label("Jeux", systemImage: "gamecontroller")
            }
            ApplicationListView()
                .tabItem {
                    Label("Apps", systemImage: "square.stack.3d.up")
                }
            ApplicationListView()
                .tabItem {
                    Label("Arcade", systemImage: "arcade.stick.console")
                }
            WebBrowserView()
                .tabItem {
                    Label("Recherche", systemImage: "magnifyingglass")
                }
        }
    }

    private var macOS: some View {
        NavigationSplitView {
            //Sidebar
            List {
                NavigationLink {
                    NavigationStack(path: $data.todayPath) {
                        ApplicationListView()
                            .navigationDestination(for: Application.self) { app in
                                AppStoreView(app: app)
                            }
                    }
                } label: {
                    Label("Aujourd'hui", systemImage: "list.bullet.rectangle.portrait")
                }
                NavigationLink {
                    Text("Jeux")
                } label: {
                    Label("Jeux", systemImage: "gamecontroller")
                }
                NavigationLink {
                    Text("Apps")
                } label: {
                    Label("Apps", systemImage: "square.stack.3d.up")
                }
                NavigationLink {
                    Text("Arcade")
                } label: {
                    Label("Arcade", systemImage: "arcade.stick.console")
                }
            }
            .listStyle(.sidebar)
        } detail: {
            // Detail
            ContentUnavailableView("Use Sidebar", systemImage: "sidebar.left")
        }
    }
}

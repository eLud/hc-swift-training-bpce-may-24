//
//  ApplicationListView.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 30/05/2024.
//

import SwiftUI

struct ApplicationListView: View {

    @Environment(AppData.self) var data: AppData

    @State private var selectedApp: Application?
    @State private var showAccount = false
    @State private var showAlert = false
    @State private var showConfirmationDialog = false
    @State private var showHomeMadeModal = false

    var body: some View {
        List(data.applications) { app in
            NavigationLink(value: app) {
                AppCellView(app: app)
            }
        }
        .toolbar {
            ToolbarItem {
                Button("Account") {
//                    showAccount.toggle()
//                    selectedApp = data.applications.first
                    showHomeMadeModal.toggle()
                }
            }
        }
        .sheet(item: $selectedApp) { app in
            AppStoreView(app: app)
        }
        .sheet(isPresented: $showAccount, content: {
            Text("Test")
                .presentationDragIndicator(.visible)
//                .presentationCornerRadius(50)
                .presentationDetents([.large, .fraction(0.5), .height(50)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(50)))
        })
        .alert("Alerte importante", isPresented: $showAlert) {
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        }
        .confirmationDialog("Confirmation", isPresented: $showConfirmationDialog) {
            Button("Logout", role: .destructive) { }
            Button("Cancel", role: .cancel) {}
        }
        .smallModal(isPresented: $showHomeMadeModal, height: 200)

    }
}

#Preview {
    NavigationStack {
        ApplicationListView()
    }
        .environment(AppData(applications: Application.demoApps))
}

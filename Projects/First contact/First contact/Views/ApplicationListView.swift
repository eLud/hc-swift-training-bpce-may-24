//
//  ApplicationListView.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 30/05/2024.
//

import SwiftUI

struct ApplicationListView: View {

    @Environment(AppData.self) var data: AppData

    var body: some View {
        List(data.applications) { app in
            NavigationLink(value: app) {
                AppCellView(app: app)
            }
        }
    }
}

#Preview {
    ApplicationListView()
        .environment(AppData(applications: Application.demoApps))
}

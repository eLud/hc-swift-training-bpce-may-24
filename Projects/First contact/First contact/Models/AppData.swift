//
//  AppData.swift
//  First contact
//
//  Created by Ludovic Ollagnier on 30/05/2024.
//

import Foundation

@Observable
class AppData {

    var showGlobalAlert: Bool
    var applications: [Application]

    var installedApp: Set<Application>

    var todayPath: [Application]

    init(applications: [Application]) {
        self.applications = applications
        installedApp = []
        showGlobalAlert = false
        todayPath = []
    }

    func install(app: Application) {
        installedApp.insert(app)
    }

    func isAppInstalled(_ app: Application) -> Bool {
        installedApp.contains(app)
    }
}

// Old way, before iOS 17
//class AppData: ObservableObject {
//
//    @Published var showDivider: Bool
//    @Published  var applications: [Application]
//
//    init(applications: [Application]) {
//        self.applications = applications
//        showDivider = true
//
////        Alternative à Published
////        objectWillChange.send()
//    }
//}

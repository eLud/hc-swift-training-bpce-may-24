//
//  ViewController.swift
//  UISwiftKit
//
//  Created by Ludovic Ollagnier on 31/05/2024.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    let appData = AppData(applications: Application.demoApps)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        configureButton()
        embeddSwiftUiView()
    }

    func configureButton() {
        let button = UIButton(primaryAction: UIAction(handler: { act in
            self.showSwiftUIView()
        }))

        button.setTitle("Show SwiftUI View", for: .normal)

        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }

    func embeddSwiftUiView() {
        
        let swiftUIView = AppIconView(iconName: "leaf")
        let someViewController = UIHostingController(rootView: swiftUIView)

        // Embedding View Controller / Add child View Controller

        guard let extractedView = someViewController.view else { return }
        view.addSubview(extractedView)

        extractedView.translatesAutoresizingMaskIntoConstraints = false
        extractedView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        extractedView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true

        extractedView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        extractedView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    func showSwiftUIView() {
        let newViewController = UIHostingController(rootView: AppStoreView(app: Application.demoApps.first!)
            .environment(appData))
        present(newViewController, animated: true)
    }
}


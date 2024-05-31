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

        guard let extractedView = someViewController.view else { return }
        view.addSubview(extractedView)

        // Embedding View Controller / Add child View Controller to allow communication
        self.addChild(someViewController)
        someViewController.didMove(toParent: self)

        extractedView.translatesAutoresizingMaskIntoConstraints = false
        extractedView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        extractedView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true

        extractedView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        extractedView.heightAnchor.constraint(equalToConstant: 100).isActive = true


        // Using private API _UIHostingView /!\ Not app store safe
        let view = _UIHostingView(rootView: swiftUIView)
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 150).isActive = true

        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    func showSwiftUIView() {
        let newViewController = UIHostingController(rootView: AppStoreView(app: Application.demoApps.first!)
            .environment(appData))
        present(newViewController, animated: true)
    }
}


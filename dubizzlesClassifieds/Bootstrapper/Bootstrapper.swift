//
//  Bootstrapper.swift
//  dubizzlesClassifieds
//
//  Copyright © 2020 Next Generation Innovation. All rights reserved.
//

import UIKit
import Foundation

struct Bootstrapper {
    
    var window: UIWindow
    static var instance: Bootstrapper?
    
    private init(window: UIWindow) {
        self.window = window
    }
    
    static func initialize(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) {
        instance = Bootstrapper(window: makeNewWindow())
        instance!.bootstrap()
    }
    
    mutating func bootstrap() {
        //Decision point to show Onboarding, Login, Home.
        showSetupView()
        window.makeKeyAndVisible()
    }
    
    static func startAppAfterSetup() {
        instance!.startAppAfterSetup()
    }
    
    static func createHome() {
        guard let instance = instance else { fatalError("Instance is not initialized") }
        instance.showHome()
    }
    
    static func decideScreenToOpen() {
        guard let instance = instance else { fatalError("Instance is not initialized") }
        instance.makeDecisonToOpenAppInState()
    }
}

extension Bootstrapper {
    
    private static func makeNewWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window = window
        }
        return window
    }
    
    private func showSetupView() {
        let controller = SplashRouter.createModule()
        self.window.rootViewController = controller
    }
    
    private func startAppAfterSetup() {
        self.getMetaData()
    }
    
    private func getMetaData() {
        self.makeDecision()
    }
    
    private func makeDecision() {
        DispatchQueue.main.async {
            self.makeDecisonToOpenAppInState()
        }
    }
    
    private func makeDecisonToOpenAppInState() {
        Bootstrapper.createHome()
    }
    
    private func showHome() {
        let controller = DashboardRouter.createModule()
        let nav = UINavigationController(rootViewController: controller)
        self.window.rootViewController = nav
    }
}

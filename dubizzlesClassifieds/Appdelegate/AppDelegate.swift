//
//  AppDelegate.swift
//  dubizzlesClassifieds
//
//  Created by Shahzaib Iqbal Bhatti on 3/8/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    weak var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Bootstrapper.initialize(launchOptions)
        
        return true
    }
}


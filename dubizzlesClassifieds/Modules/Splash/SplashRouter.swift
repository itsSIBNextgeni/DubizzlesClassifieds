//
//  SplashRouter.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 3/8/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

class SplashRouter: SplashWireframeProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let storyboard = getStoryBoard(.main)
        let view = storyboard.instantiateViewController(ofType: SplashViewController.self)
        let interactor = SplashInteractor()
        let router = SplashRouter()
        let presenter = SplashPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    func goToHome() {
        Bootstrapper.startAppAfterSetup()
    }
}

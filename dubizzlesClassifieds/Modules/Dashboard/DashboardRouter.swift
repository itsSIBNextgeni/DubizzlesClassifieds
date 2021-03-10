//
//  DashboardRouter.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 3/8/21.
//

import UIKit

class DashboardRouter {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let storyboard = getStoryBoard(.main)
        let view = storyboard.instantiateViewController(ofType: DashboardViewController.self)
        
        let interactor = DashboardInteractor()
        let router = DashboardRouter()
        let presenter = DashboardPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
extension DashboardRouter: DashboardWireframeProtocol {
    func openItemDetails(with ofItem: Product) {
        let controller = DetailsRouter.createModule(withDetails: ofItem)
        self.viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}

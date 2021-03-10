//
//  DetailsRouter.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 08/03/2021.
//

import UIKit

final class DetailsRouter {

    weak var viewController: UIViewController?

    static func createModule(withDetails: Product) -> UIViewController {

        let storyboard = getStoryBoard(.main)
        let view = storyboard.instantiateViewController(ofType: DetailsViewController.self)
        
        let interactor = DetailsInteractor()
        let router = DetailsRouter()
        let presenter = DetailsPresenter(interface: view, interactor: interactor, router: router, details: withDetails)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}

extension DetailsRouter: DetailsWireframeProtocol {

}

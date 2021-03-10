//
//  DetailsPresenter.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 08/03/2021.
//

import UIKit

final class DetailsPresenter {

    weak private var view: DetailsViewProtocol?
    var interactor: DetailsInteractorInputProtocol?
    private let router: DetailsWireframeProtocol
    
    var itemeDetails: Product

    init(interface: DetailsViewProtocol,
         interactor: DetailsInteractorInputProtocol?,
         router: DetailsWireframeProtocol,
         details: Product) {
        self.view = interface
        self.interactor = interactor
        self.router = router
        self.itemeDetails = details
    }
}

extension DetailsPresenter: DetailsPresenterProtocol {

}

extension DetailsPresenter: DetailsInteractorOutputProtocol {

}

//
//  DetailsProtocols.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 08/03/2021.
//

import Foundation

// MARK: Wireframe -
protocol DetailsWireframeProtocol: class {

}
// MARK: Presenter -
protocol DetailsPresenterProtocol: class {

    var interactor: DetailsInteractorInputProtocol? { get set }
    var itemeDetails: Product { get set }
}

// MARK: Interactor -
protocol DetailsInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol DetailsInteractorInputProtocol: class {

    var presenter: DetailsInteractorOutputProtocol? { get set }

    /* Presenter -> Interactor */
}

// MARK: View -
protocol DetailsViewProtocol: class {

    var presenter: DetailsPresenterProtocol? { get set }

    /* Presenter -> ViewController */
}

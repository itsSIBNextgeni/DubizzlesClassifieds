//
//  SplashProtocols.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 3/8/21.

//

import Foundation

//MARK: Wireframe -
protocol SplashWireframeProtocol: class {
    func goToHome()
}
//MARK: Presenter -
protocol SplashPresenterProtocol: class {

    var interactor: SplashInteractorInputProtocol? { get set }
    
    func viewWillAppear()
}

//MARK: Interactor -
protocol SplashInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol SplashInteractorInputProtocol: class {

    var presenter: SplashInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol SplashViewProtocol: class {

    var presenter: SplashPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}

//
//  DashboardProtocols.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 3/8/21.
//

import Foundation

//MARK: Wireframe -
protocol DashboardWireframeProtocol: class {
    func openItemDetails(with ofItem: Product)
}
//MARK: Presenter -
protocol DashboardPresenterProtocol: class {

    var interactor: DashboardInteractorInputProtocol? { get set }
    
    func makeNetowrkCall()
    func makeMockNetowrkCall()
    
    var dataProducts: [Product]? { get set }
    
    func getProductsCount() -> Int
    func getProducts(at index: Int) -> Product?
    func didSelectItem(at index: Int)
}

//MARK: Interactor -
protocol DashboardInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    
    func setProducts(set: [Product])
}

protocol DashboardInteractorInputProtocol: class {

    var presenter: DashboardInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
    func makeNetowrkCall()
    func makeMockNetowrkCall()
}

//MARK: View -
protocol DashboardViewProtocol: class {

    var presenter: DashboardPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    
    func showLoader()
    func hideLoader()
    func reloadCollection()
}

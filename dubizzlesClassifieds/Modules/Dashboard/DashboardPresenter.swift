//
//  DashboardPresenter.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 3/8/21.
//

import UIKit

class DashboardPresenter: DashboardPresenterProtocol {
    var dataProducts: [Product]?
    
    weak private var view: DashboardViewProtocol?
    var interactor: DashboardInteractorInputProtocol?
    private let router: DashboardWireframeProtocol

    init(interface: DashboardViewProtocol, interactor: DashboardInteractorInputProtocol?, router: DashboardWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    func makeNetowrkCall() {
        view?.showLoader()
        interactor?.makeNetowrkCall()
    }
    func makeMockNetowrkCall() {
        view?.showLoader()
        interactor?.makeMockNetowrkCall()
    }
    
    func getProductsCount() -> Int {
        return  dataProducts?.count ?? 0
    }
    
    func getProducts(at index: Int) -> Product? {
        return dataProducts?[index]
    }
    
    func didSelectItem(at index: Int) {
        guard let product = dataProducts?[index] else {
            return
        }
        router.openItemDetails(with: product)
    }
}
extension DashboardPresenter: DashboardInteractorOutputProtocol {
    func setProducts(set: [Product]) {
        dataProducts = set
        view?.hideLoader()
        view?.reloadCollection()
    }
}

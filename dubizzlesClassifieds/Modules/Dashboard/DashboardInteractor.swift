//
//  DashboardInteractor.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 3/8/21.
//

import UIKit

class DashboardInteractor: DashboardInteractorInputProtocol {

    weak var presenter: DashboardInteractorOutputProtocol?
    
    func makeNetowrkCall() {
        let apiRequest = ApiManager<[Product]>(successHandler: { (data: [Product]) -> Void in
            self.presenter?.setProducts(set: data)
        }, errorHandler: { (_, message, _)  in
            // MARK: Server error is shown if received, otherwise generic error appears on screen.
            print(message ?? "")
        })
        apiRequest.makeNetworkCall(endPointUrl: NetworkUrls.classified, requestType: .get)
    }
    func makeMockNetowrkCall() {
        if let url = Bundle.main.url(forResource: "items", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Product].self, from: data)
                self.presenter?.setProducts(set: jsonData)
            } catch {
                print("error:\(error)")
                fatalError()
            }
        }
    }
}

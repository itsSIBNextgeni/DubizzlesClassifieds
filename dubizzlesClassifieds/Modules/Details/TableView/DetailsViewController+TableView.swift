//
//  DetailsViewController+TableView.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 08/03/2021.
//

import Foundation
import UIKit

extension DetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(with: ItemImagesTableViewCell.self, for: indexPath)
            cell.images = self.presenter?.itemeDetails.imageUrls ?? []
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(with: DetailsTableViewCell.self, for: indexPath)
            cell.priceLable.text = presenter?.itemeDetails.price
            cell.titleLable.text = presenter?.itemeDetails.name?.capitalized
            cell.layoutIfNeeded()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 350
        default:
            return UITableView.automaticDimension
        }
    }
}

extension DetailsViewController: UITableViewDelegate {
    
}

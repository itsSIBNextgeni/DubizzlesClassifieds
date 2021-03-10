//
//  Dashboiard+CollectioView.swift
//  DubizzlesClassifieds
//
//  Created by Shahzaib Iqbal Bhatti on 3/8/21.
//

import UIKit
extension DashboardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        presenter?.didSelectItem(at: indexPath.row)
    }
}
extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getProductsCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: HomeCollectionViewCell.self, for: indexPath)
        cell.setUpCell(data: presenter?.getProducts(at: indexPath.row))
        return cell
    }
}
extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return CGSize(width: 0.0, height: 0.0)
        }
        let space: CGFloat = flowLayout.minimumInteritemSpacing + flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let size: CGFloat = (collectionView.frame.width - space) / 2.0
        return CGSize(width: size, height: 220)
    }
}


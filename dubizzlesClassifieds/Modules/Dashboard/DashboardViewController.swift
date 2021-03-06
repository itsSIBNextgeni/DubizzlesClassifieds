//
//  DashboardViewController.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 3/8/21.

//

import UIKit

class DashboardViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var presenter: DashboardPresenterProtocol?

    //MARK: SYSTEM func -
	override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.makeNetowrkCall()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
extension DashboardViewController {
    func setupView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: HomeCollectionViewCell.self)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 6
        flowLayout.minimumInteritemSpacing = 6
        flowLayout.scrollDirection = .vertical
        collectionView.collectionViewLayout = flowLayout
    }
}
extension DashboardViewController: DashboardViewProtocol {
    func showLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.showLoadingIndicator()
        }
    }
    func hideLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.hideLoadingIndicator()
        }
    }
    func reloadCollection() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

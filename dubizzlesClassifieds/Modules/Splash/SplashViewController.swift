//
//  SplashViewController.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 3/8/21.

//

import UIKit

class SplashViewController: UIViewController, SplashViewProtocol {

	var presenter: SplashPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
}

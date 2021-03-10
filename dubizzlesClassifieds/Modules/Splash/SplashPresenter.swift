//
//  SplashPresenter.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 3/8/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SplashPresenter: SplashPresenterProtocol, SplashInteractorOutputProtocol {

    weak private var view: SplashViewProtocol?
    var interactor: SplashInteractorInputProtocol?
    private let router: SplashWireframeProtocol
    
    private let deadline: DispatchTime = .now() + 2.0

    init(interface: SplashViewProtocol, interactor: SplashInteractorInputProtocol?, router: SplashWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func viewWillAppear() {
        DispatchQueue.main.asyncAfter(deadline: deadline, execute:  { [weak self] in
            self?.router.goToHome()
        })
    }
}
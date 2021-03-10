//
//  Storyboard.swift
//  DubizzlesClassifieds
//
//  Created by Shahzaib Iqbal Bhatti on 3/8/21.
//

import UIKit

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>(ofType _: T.Type,
                                                        withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        guard let controller = instantiateViewController(withIdentifier: identifier) as? T else {
            assertionFailure("instantiateNavigationController controller unwrapped failed")
            fatalError()
        }
        return controller
    }

    func instantiateNavigationController<T: UINavigationController>(ofType _: T.Type,
                                                                    withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        guard let navigationController = instantiateViewController(withIdentifier: identifier) as? T else {
            assertionFailure("instantiateNavigationController navigation controller unwrapped failed")
            fatalError()
        }
        return navigationController
    }
}


//
//  BaseViewController.swift
//  DubizzlesClassifieds
//
//  Created by Shahzaib Iqbal Bhatti on 3/8/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    let viewBGLoder: UIView = UIView()
    var activityView: ProgressView!
    
    let bgViewTag = ViewTags.bgViewTag.rawValue
    let activityViewTag = ViewTags.activityViewTag.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func addDimView() {
        self.viewBGLoder.frame = UIScreen.main.bounds
        self.viewBGLoder.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.viewBGLoder.tag = bgViewTag
        UIApplication.shared.windows.first?.addSubview(self.viewBGLoder)
    }
    
    func showLoadingIndicator(withDimView: Bool = false) {
        if activityView == nil {
            
            let originX = UIScreen.main.bounds.width/2
            let originY = UIScreen.main.bounds.height/2
            let frame = CGRect(x: originX - 50.0/2,
                               y: originY - 50.0/2,
                               width: 50.0,
                               height: 50.0)
            
            activityView = ProgressView(colors: [.red, .systemGreen, .systemBlue], lineWidth: 5)
            activityView.frame = frame
            activityView.translatesAutoresizingMaskIntoConstraints = false
            
            activityView.tag = activityViewTag
            
            // add subview
            withDimView ? self.addDimView() : ()
            UIApplication.shared.windows.first?.addSubview(self.activityView)
            activityView.animateStroke()
            activityView.animateRotation()
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async {[weak self] in
            if self?.activityView != nil {
                self?.viewBGLoder.removeFromSuperview()
                self?.activityView = nil
                UIApplication.shared.windows.first?.viewWithTag(ViewTags.bgViewTag.rawValue)?.removeFromSuperview()
                UIApplication.shared.windows.first?.viewWithTag(ViewTags.activityViewTag.rawValue)?.removeFromSuperview()
            }
        }
    }
}

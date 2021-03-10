//
//  UIImageView.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti onon 8/3/2021.
//

import Foundation
import UIKit
import DubizzleImageCaheManager

class ImageManager {
    
    static var shared = ImageManager()
    
    static let imageCacher = ImageCacher()
    
    func setImage(with url: String, imageView: UIImageView) {
        ImageManager.imageCacher.downloadAndShowImage(from: url, on: imageView)
    }
}

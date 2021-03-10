//
//  ImageObject.swift
//  BayutDubizzleImageCacher
//
//  Created by Shahzaib Iqbal Bhatti on 10/3/2021.
//

import Foundation
import UIKit

class ImageObject: NSObject, NSDiscardableContent {
    
    var image: UIImage!
    
    func beginContentAccess() -> Bool {
        return true
    }
    
    func endContentAccess() {
        
    }
    
    func discardContentIfPossible() {
        
    }
    
    func isContentDiscarded() -> Bool {
        return false
    }
}

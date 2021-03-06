//
//  ImageCacher.swift
//  BayutDubizzleImageCacher
//
//  Created by Shahzaib Iqbal Bhatti on 10/3/2021.
//

import Foundation
import UIKit

private let imageStore = NSCache<NSString, ImageObject>()

open class ImageCacher {
    
    public init() { }
    
    open func downloadAndShowImage(from url: String, on imageView: UIImageView) {
        
        guard let imgUrl = URL(string: url.trimmingCharacters(in: .whitespacesAndNewlines)) else { return }

        if let imageFromCache = imageStore.object(forKey: url as NSString) {
            imageView.image = imageFromCache.image
            return
        }
        
        URLSession.shared.dataTask(with: imgUrl, completionHandler: { (data, _, error) -> Void in
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                if let data = data, let image = UIImage(data: data) {
                    let cacheImage = ImageObject()
                    cacheImage.image = image
                    imageStore.setObject(cacheImage, forKey: url as NSString)
                    imageView.image = image
                }
            })
            
        }).resume()
    }
}

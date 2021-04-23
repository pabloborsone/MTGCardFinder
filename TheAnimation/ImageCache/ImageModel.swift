//
//  ImageModel.swift
//  TheAnimation
//
//  Created by Pablo Borsone on 23/04/21.
//

import UIKit

class ImageModel {
    var cacheImage = ImageCache.getImageCache()
    var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func loadImageFromCache() -> UIImage? {
        guard let cacheImage = cacheImage.get(forKey: urlString) else { return nil }
        
        return cacheImage
    }
}

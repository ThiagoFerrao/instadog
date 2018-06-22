//
//  GalleryCollectionViewCell.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit
import Kingfisher

class GalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dogImage: UIImageView!
    
    var imageUrlString: String? {
        didSet {
            guard let imageString = imageUrlString, let imageUrl = URL(string: imageString) else {
                return
            }
            
            self.dogImage.kf.setImage(with: imageUrl
                , placeholder: UIImage(named: "icon_app")
                , options: [
                    .transition(.fade(1)),
                ], progressBlock: nil, completionHandler: nil)
        }
    }
}

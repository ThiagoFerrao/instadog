//
//  PhotoViewController.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var dogBreedLabel: UILabel!
    @IBOutlet weak var dogPhotoImage: UIImageView!
    
    var dogBreed: String?
    var dogPhoto: String?
    
    override func viewDidLoad() {
        dogBreedLabel.text = dogBreed
        
        guard let imageString = dogPhoto, let imageUrl = URL(string: imageString) else {
            return
        }
        
        self.dogPhotoImage.kf.setImage(with: imageUrl
            , placeholder: UIImage(named: "icon_app")
            , options: [
                .transition(.fade(1)),
                ], progressBlock: nil, completionHandler: nil)
    }
}

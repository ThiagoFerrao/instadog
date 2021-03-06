//
//  GalleryViewInterface.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

protocol GalleryViewInterface {
    func setupContent()
    func showLoading()
    func hideLoading()
    func updateGalleryData(_ newGalleryData: [String : [String]])
    func showAlert(_ alertController: UIAlertController)
    func presentPhotoScreen(send sendData: (String?, String?))
}

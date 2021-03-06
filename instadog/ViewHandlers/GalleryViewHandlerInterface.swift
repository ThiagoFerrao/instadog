//
//  GalleryViewHandlerInterface.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

protocol GalleryViewHandlerInterface {
    func viewDidLoad()
    func segmentWasChangedTo(_ index: Int, title: String?)
    func dogPhotoSelected(category: String?, photo: String?)
}

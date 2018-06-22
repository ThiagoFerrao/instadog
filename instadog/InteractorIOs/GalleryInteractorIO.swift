//
//  GalleryInteractorIO.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

protocol GalleryInteractorInput {
    func getGalleryOfCategory(_ index: Int, title: String)
}

protocol GalleryInteractorOutput {
    func getCategoryDataSuccessful(_ dataResult: [String : [String]])
    func failedToGetUserToken()
    func getCategoryDataFailed()
}

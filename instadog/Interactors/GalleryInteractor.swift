//
//  GalleryInteractor.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

class GalleryInteractor: NSObject {
    var interactorOutput : GalleryInteractorOutput?
    
    init(output: GalleryInteractorOutput) {
        super.init()
        
        self.interactorOutput = output
    }
}


// MARK: GalleryInteractorInput

extension GalleryInteractor: GalleryInteractorInput {
    func getGalleryOfCategory(_ index: Int, title: String) {
        
    }
}

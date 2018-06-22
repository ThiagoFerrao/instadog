//
//  GalleryPresenter.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

class GalleryPresenter: NSObject {
    var userInterface   : GalleryViewInterface?
    var interactorInput : GalleryInteractorInput?
    
    init(userInterface: GalleryViewInterface) {
        super.init()
        
        self.interactorInput = GalleryInteractor(output: self)
        self.userInterface = userInterface
    }
}


// MARK: GalleryViewHandlerInterface

extension GalleryPresenter: GalleryViewHandlerInterface {
    func viewDidLoad() {
        
    }
}


// MARK: GalleryInteractorOutput

extension GalleryPresenter: GalleryInteractorOutput {
    
}

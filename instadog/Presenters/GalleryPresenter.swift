//
//  GalleryPresenter.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

class GalleryPresenter: NSObject {
    var userInterface   : GalleryViewInterface?
    var interactorInput : GalleryInteractorInput?
    
    init(userInterface: GalleryViewInterface) {
        super.init()
        
        self.interactorInput = GalleryInteractor(output: self)
        self.userInterface = userInterface
    }
    
    
    // MARK: Private Methods
    
    private func segmentTitleIsNil() {
        let alertController = UIAlertController(title: "Ops!"
            , message: "An error occurred during the segment selection :(\nPlease, select the desired category again"
            , preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
        
        userInterface?.showAlert(alertController)
    }
}


// MARK: GalleryViewHandlerInterface

extension GalleryPresenter: GalleryViewHandlerInterface {
    func viewDidLoad() {
        userInterface?.setupContent()
    }
    
    func segmentWasChangedTo(_ index: Int, title: String?) {
        guard let segmentTitle = title else {
            segmentTitleIsNil()
            return
        }
        
        userInterface?.showLoading()
        interactorInput?.getGalleryOfCategory(index, title: segmentTitle)
    }
}


// MARK: GalleryInteractorOutput

extension GalleryPresenter: GalleryInteractorOutput {
    func getCategoryDataSuccessful(_ dataResult: [String : [String]]) {
        
    }
    
    func failedToGetUserToken() {
        
    }
    
    func getCategoryDataFailed() {
        
    }
}

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
        var userToken = ""
        
        do {
            userToken = try KeychainStoreUtil.shared.getUserToken()
        } catch {
            interactorOutput?.failedToGetUserToken()
            return
        }
        
        CategoryService.shared.getCategoryData(category: title.lowercased(), userToken: userToken
            , success: { (category) in
                guard let categoryResult = category.category, let dogPhotoListResult = category.dogPhotoList else {
                    self.interactorOutput?.getCategoryDataFailed()
                    return
                }
                
                var categoryData = [String : [String]]()
                categoryData.updateValue(dogPhotoListResult, forKey: categoryResult)
                
                self.interactorOutput?.getCategoryDataSuccessful(categoryData)
                
        }) { (error) in
            self.interactorOutput?.getCategoryDataFailed()
        }
    }
}

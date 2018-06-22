//
//  Category.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation
import ObjectMapper

class Category: Mappable {
    var category: String?
    var dogPhotoList: [String]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        category <- map["category"]
        dogPhotoList <- map["list"]
    }
}

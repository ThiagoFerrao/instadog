//
//  UserAuth.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation
import ObjectMapper

class UserAuth: Mappable {
    var id: String?
    var token: String?
    var createdAt: String?
    var updatedAt: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["user._id"]
        token <- map["user.token"]
        createdAt <- map["user.createdAt"]
        updatedAt <- map["user.updatedAt"]
    }
}

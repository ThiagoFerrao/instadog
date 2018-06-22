//
//  KeychainStoreUtil.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation
import KeychainAccess

class KeychainStoreUtil {
    
    static let shared = KeychainStoreUtil()
    
    let keychain = Keychain(service: Constants.KEYCHAIN.STORAGE)
    
    func storeUserToken(userToken: String) throws {
        try keychain.set(userToken, key: Constants.KEYCHAIN.USER_TOKEN)
    }
    
    func getUserToken() throws -> String {
        guard let userToken = try keychain.get(Constants.KEYCHAIN.USER_TOKEN) else {
            throw NSError(domain: "Unable to get user token", code: 0, userInfo: nil)
        }
        
        return userToken
    }
}

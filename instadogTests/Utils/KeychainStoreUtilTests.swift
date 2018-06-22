//
//  KeychainStoreUtilTests.swift
//  instadogTests
//
//  Created by Thiago Cruz on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import XCTest
import KeychainAccess
@testable import instadog

class KeychainStoreUtilTests: XCTestCase {
    
    let keychain = Keychain(service: Constants.KEYCHAIN.STORAGE)
    let expectUserToken = "expectUserToken"
    
    override func setUp() {
        do {
            try keychain.removeAll()
            
        } catch {
            assertionFailure("Unable to remove all keys from keychain")
        }
    }
    
    func testStoreUserToken() {
        do {
            try KeychainStoreUtil.shared.storeUserToken(userToken: expectUserToken)
            let testUserToken = try keychain.get(Constants.KEYCHAIN.USER_TOKEN) ?? "ERROR"
            
            XCTAssertEqual(expectUserToken, testUserToken)
            
        } catch {
            assertionFailure("Unable to finish the testStoreUserToken")
        }
    }
    
    func testGetUserToken() {
        do {
            try keychain.set(expectUserToken, key: Constants.KEYCHAIN.USER_TOKEN)
            let testUserToken = try KeychainStoreUtil.shared.getUserToken()
            
            XCTAssertEqual(expectUserToken, testUserToken)
            
        } catch {
            assertionFailure("Unable to finish the testGetUserToken")
        }
    }
}

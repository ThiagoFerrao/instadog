//
//  ValidationUtilTests.swift
//  instadogTests
//
//  Created by Thiago Cruz on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import XCTest
@testable import instadog

class ValidationUtilTests: XCTestCase {
    
    let validEmailOne = "user_name012@site.com"
    let validEmailTwo = "name.surname@prov.us"
    let validEmailThree = "test@test.br"
    
    let invalidEmailOne = "tést@test.com"
    let invalidEmailTwo = "test@test.c"
    let invalidEmailThree = "test@tes"
    
    let validUtil = ValidationUtil.shared
    
    func testIsEmail() {
        XCTAssertTrue(validUtil.isEmail(validEmailOne))
        XCTAssertTrue(validUtil.isEmail(validEmailTwo))
        XCTAssertTrue(validUtil.isEmail(validEmailThree))
        
        XCTAssertFalse(validUtil.isEmail(invalidEmailOne))
        XCTAssertFalse(validUtil.isEmail(invalidEmailTwo))
        XCTAssertFalse(validUtil.isEmail(invalidEmailThree))
    }
}

//
//  LoginInteractorIO.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

protocol LoginInteractorInput {
    func postUserEmail(_ email: String)
}

protocol LoginInteractorOutput {
    func postUserEmailSuccessful()
    func failedToStoreUserToken()
    func postUserEmailFailed()
}

//
//  LoginInteractor.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

class LoginInteractor: NSObject {
    var interactorOutput : LoginInteractorOutput?
    
    init(output: LoginInteractorOutput) {
        super.init()
        
        self.interactorOutput = output
    }
}


// MARK: LoginInteractorOutput

extension LoginInteractor: LoginInteractorInput {
    func postUserEmail(_ email: String) {
        LoginService.shared.postUserEmail(email: email
            , success: { (userAuth) in
                guard let userToken = userAuth.token else {
                    self.interactorOutput?.failedToStoreUserToken()
                    return
                }
                
                do {
                    try KeychainStoreUtil.shared.storeUserToken(userToken: userToken)
                } catch {
                    self.interactorOutput?.failedToStoreUserToken()
                    return
                }
                
                self.interactorOutput?.postUserEmailSuccessful()
                
        }) { (error) in
            self.interactorOutput?.postUserEmailFailed()
        }
    }
}

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
        
    }
}

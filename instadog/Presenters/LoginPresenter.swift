//
//  LoginPresenter.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginPresenter: NSObject {
    var userInterface   : LoginViewInterface?
    var interactorInput : LoginInteractorInput?
    
    init(userInterface: LoginViewInterface) {
        super.init()
        
        self.interactorInput = LoginInteractor(output: self)
        self.userInterface = userInterface
    }
}


// MARK: LoginModuleInterface

extension LoginPresenter: LoginModuleInterface {
    func viewDidLoad() {
        userInterface?.setupLoginTextFieldDelegate(self)
    }
}


// MARK: LoginInteractorOutput

extension LoginPresenter: LoginInteractorOutput {
    
}


// MARK: UITextFieldDelegate

extension LoginPresenter: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let emailField = textField as? SkyFloatingLabelTextField
        
        guard let oldEmailText = emailField?.text, let validRange = Range(range, in: oldEmailText) else {
            return true
        }
        
        let newEmailText = oldEmailText.replacingCharacters(in: validRange, with: string)
        
        if newEmailText.isEmpty {
            emailField?.errorMessage = ""
            return true
        }
        
        if !ValidationUtil.shared.isEmail(newEmailText) {
            emailField?.errorMessage = "Invalid email"
            return true
        }
        
        emailField?.errorMessage = ""
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        let emailField = textField as? SkyFloatingLabelTextField
        emailField?.errorMessage = ""
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

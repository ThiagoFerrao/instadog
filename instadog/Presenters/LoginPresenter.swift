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
    
    
    // MARK: Private Methods
    
    private func emailIsInvalid() {
        let alertController = UIAlertController(title: "Ops!"
            , message: "The email address entered is invalid :(\nPlease, reenter it"
            , preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
        
        userInterface?.showAlert(alertController)
    }
}


// MARK: LoginModuleInterface

extension LoginPresenter: LoginViewHandlerInterface {
    func viewDidLoad() {
        userInterface?.setupLoginTextFieldDelegate(self)
    }
    
    func enterEmailButtonTapped(isEmailValid: Bool, userEmail: String?) {
        guard let email = userEmail, !email.isEmpty, email != "Email Address", isEmailValid else {
            emailIsInvalid()
            return
        }
        
        userInterface?.showLoading()
        interactorInput?.postUserEmail(email)
    }
}


// MARK: LoginInteractorOutput

extension LoginPresenter: LoginInteractorOutput {
    func postUserEmailSuccessful() {
        userInterface?.hideLoading()
        userInterface?.presentGalleryScreen()
    }
    
    func failedToStoreUserToken() {
        let alertController = UIAlertController(title: "Ops!"
            , message: "We were unable to store your account athentication :(\nPlease, try to login again later"
            , preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
        
        userInterface?.hideLoading()
        userInterface?.showAlert(alertController)
    }
    
    func postUserEmailFailed() {
        let alertController = UIAlertController(title: "Ops!"
            , message: "We were unable to connect to our server :(\nPlease, try to login again later"
            , preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
        
        userInterface?.hideLoading()
        userInterface?.showAlert(alertController)
    }
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

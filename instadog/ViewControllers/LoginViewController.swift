//
//  LoginViewController.swift
//  instadog
//
//  Created by Thiago Ferrão on 21/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    
    @IBAction func enterEmailButtonTapped() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
    }
}


// MARK: UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
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

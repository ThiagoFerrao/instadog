//
//  LoginViewController.swift
//  instadog
//
//  Created by Thiago Ferrão on 21/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    
    @IBAction func enterEmailButtonTapped() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let emailTextField = textField as? SkyFloatingLabelTextField
        
        if let text = textField.text, (text.count < 3 || !text.contains("@")) {
            emailTextField?.errorMessage = "Invalid email"
            return true
        }
        
        emailTextField?.errorMessage = ""
        return true
    }
}

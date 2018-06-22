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
    
    var eventHandler: LoginModuleInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = LoginPresenter(userInterface: self)
        eventHandler?.viewDidLoad()
    }
}


// MARK: LoginViewInterface

extension LoginViewController: LoginViewInterface {
    func setupLoginTextFieldDelegate(_ delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
    }
}

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
    
    @IBOutlet weak var emailContainer: UIView!
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBAction func enterEmailButtonTapped() {
        eventHandler?.enterEmailButtonTapped(isEmailValid: !emailTextField.hasErrorMessage, userEmail: emailTextField?.text)
    }
    
    var eventHandler: LoginViewHandlerInterface?
    
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
    
    func showLoading() {
        loadingIndicator.isHidden = false
        emailContainer.alpha = Constants.ALPHA.DISABLE
        view.isUserInteractionEnabled = false
    }
    
    func hideLoading() {
        loadingIndicator.isHidden = true
        emailContainer.alpha = Constants.ALPHA.ENABLE
        view.isUserInteractionEnabled = true
    }
    
    func showAlert(_ alertController: UIAlertController) {
        present(alertController, animated: true, completion: nil)
    }
    
    func presentPhotoGalleryScreen() {
        performSegue(withIdentifier: Constants.SEGUE_IDENTIFIER.TO_GALLERY, sender: nil)
    }
}

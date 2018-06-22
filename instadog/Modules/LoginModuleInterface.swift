//
//  LoginModuleInterface.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation


protocol LoginModuleInterface {
    func viewDidLoad()
    func enterEmailButtonTapped(isEmailValid: Bool, userEmail: String?)
}

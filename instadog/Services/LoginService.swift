//
//  LoginService.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation
import Alamofire

class LoginService: BaseService {
    
    static let shared = LoginService()
    
    internal func postUserEmail(email: String, success: @escaping (UserAuth) -> Void, failure: @escaping FAILURE_HANDLER) {
        let requestHeader = self.createHeader()
        let requestUrl = self.createUrlWithPath(Constants.PATH.SIGNUP)
        let requestParameters = ["email" : email]
        
        Alamofire.request(requestUrl, method: HTTPMethod.post, parameters: requestParameters, encoding: URLEncoding.queryString, headers: requestHeader)
            .validate(statusCode: SUCCESS_STATUS_CODE)
            .responseJSON { (dataResponse) in
                
                switch dataResponse.result {
                case .success(let result):
                    guard let jsonResult = result as? [String : Any] else {
                        failure(NSError(domain: "Unable to parse result to json", code: dataResponse.response?.statusCode ?? 0, userInfo: nil))
                        return
                    }
                    
                    guard let userAuth = UserAuth(JSON: jsonResult) else {
                        failure(NSError(domain: "Unable to parse json to model", code: dataResponse.response?.statusCode ?? 0, userInfo: nil))
                        return
                    }
                    
                    success(userAuth)
                    
                case .failure(let error):
                    failure(error)
                }
        }
    }
}

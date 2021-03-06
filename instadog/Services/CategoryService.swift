//
//  CategoryService.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation
import Alamofire

class CategoryService: BaseService {
    
    static let shared = CategoryService()
    
    internal func getCategoryData(category: String, userToken: String, success: @escaping (Category) -> Void, failure: @escaping FAILURE_HANDLER) {
        let requestHeader = self.createHeader(["Authorization" : userToken])
        let requestUrl = self.createUrlWithPath(Constants.PATH.FEED)
        let requestParameters = ["category" : category]
        
        Alamofire.request(requestUrl, method: HTTPMethod.get, parameters: requestParameters, encoding: URLEncoding.queryString, headers: requestHeader)
            .validate(statusCode: SUCCESS_STATUS_CODE)
            .responseJSON { (dataResponse) in
                
                switch dataResponse.result {
                case .success(let result):
                    guard let jsonResult = result as? [String : Any] else {
                        failure(NSError(domain: "Unable to parse result to json", code: dataResponse.response?.statusCode ?? 0, userInfo: nil))
                        return
                    }
                    
                    guard let categoryResult = Category(JSON: jsonResult) else {
                        failure(NSError(domain: "Unable to parse json to model", code: dataResponse.response?.statusCode ?? 0, userInfo: nil))
                        return
                    }
                    
                    success(categoryResult)
                    
                case .failure(let error):
                    failure(error)
                }
        }
    }
}

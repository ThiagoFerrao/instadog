//
//  BaseService.swift
//  instadog
//
//  Created by Thiago Ferrão on 22/06/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation
import Alamofire

class BaseService: NSObject {
    let SUCCESS_STATUS_CODE = 200...307
    typealias FAILURE_HANDLER = (Error) -> Void
    
    private let DEFAULT_HEADER: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    internal func createHeader() -> [String: String] {
        return DEFAULT_HEADER
    }
    
    internal func createHeader(_ headers: [String: String]) -> [String: String] {
        return DEFAULT_HEADER.merging(headers) { (_, new) in new }
    }
    
    internal func createUrlWithPath(_ path: String) -> String {
        return "\(Constants.URL.API)\(path)"
    }
}

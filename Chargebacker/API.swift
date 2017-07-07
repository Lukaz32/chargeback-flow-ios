//
//  API.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 21/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

fileprivate let strings = R.string.api.self

public struct API {
    
    static let baseEndpoint = "https://nu-mobile-hiring.herokuapp.com"
    
    static var genericErrorMessage = strings.genericErrorMessage()
    
    public static func loadBaseData(completion: @escaping ReturnBaseOutput) {
        
        let url = baseEndpoint
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            guard let data = response.data, response.response?.statusCode == 200 else {
                return completion(nil, ErrorHandler.errorMessageFromResponse(response))
            }
            completion(BaseOutput(json: JSON(data)), nil)
        }
    }
    
    internal static func requestForObject<T: Output>(url: URLComposer, method: HTTPMethod, parameters: [String: Any]? = nil, completion: @escaping (T?, String?) -> Void) {
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            guard let data = response.data, response.response?.statusCode == 200 else {
                return completion(nil, ErrorHandler.errorMessageFromResponse(response))
            }
            completion(T(json: JSON(data)), nil)
        }
    }
    
    internal static func requestForBool(url: URLComposer, method: HTTPMethod, parameters: [String: Any]? = nil, completion: @escaping ReturnBoolOutput) {
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            guard response.response?.statusCode == 200 else {
                return completion(false, ErrorHandler.errorMessageFromResponse(response))
            }
            completion(true, nil)
        }
    }
}

internal protocol Output {
    init(json: JSON)
}

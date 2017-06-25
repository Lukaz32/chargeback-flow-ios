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
import ALLoadingView

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
    
    static func showSpinner() {
        ALLoadingView.manager.showLoadingView(ofType: .basic, windowMode: .fullscreen)
    }
    
    static func hideSpinner() {
        ALLoadingView.manager.hideLoadingView()
    }
}

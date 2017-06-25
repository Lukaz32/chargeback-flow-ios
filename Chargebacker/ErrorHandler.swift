//
//  ErrorHandler.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import Alamofire

struct ErrorHandler {
    
    static func errorMessageFromResponse(_  response: DataResponse<Any>) -> String {
        guard let serverMessage = (response.result.value as? NSDictionary)?["mensagem"] as? String else {
            return API.genericErrorMessage
        }
        return serverMessage
    }
}

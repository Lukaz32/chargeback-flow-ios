//
//  Notice.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension API {
    
    public struct Notice {
        
        public static func getData(showSpinner: Bool = true, completion: @escaping ReturnNoticeOutput) {
            
            let url = URLComposer(path: [.notice])
            if showSpinner { API.showSpinner() }
            
            Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { response in
               API.hideSpinner()
                guard let data = response.data, response.response?.statusCode == 200 else {
                    return completion(nil, ErrorHandler.errorMessageFromResponse(response))
                }
                completion(NoticeOutput(json: JSON(data)), nil)
            }
        }
    }
}

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
        
        public static func getData(completion: @escaping ReturnNoticeOutput) {
            
            let url = URLComposer(path: [.notice])
            
            API.requestForObject(url: url, method: .get, completion: completion)
        }
    }
}

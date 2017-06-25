//
//  URLComposer.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import Alamofire

internal struct URLComposer {
    let paths: [Path]
    let queries: [String]?
    
    init(path: [Path], query: [String]? = nil) {
        self.paths = path
        self.queries = query
    }
}

extension URLComposer: URLConvertible {
    func asURL() throws -> URL {
        let baseString = API.baseEndpoint
        
        let pathString = paths.reduce("") { current, path in
            return current + "/" + path.getPath()
        }
        
        let queryString = queries?.reduce("?1=1") { current, query in
            return current + "&" + query
            } ?? ""
        
        let urlString = baseString + pathString + queryString
        
        guard let url = URL(string: urlString) else {
            throw AFError.invalidURL(url: urlString)
        }
        
        return url
    }
}

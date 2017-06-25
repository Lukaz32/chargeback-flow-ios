//
//  BaseOutput.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import SwiftyJSON

public class BaseOutput {
    public let links: [Link]
    
    public init(json: JSON) {
        links = json["links"].map { Link(key: $0, json: $1) }
    }
    
    public struct Link {
        public let identifier: String
        public let href: String
    }
}

extension BaseOutput.Link {
    public init(key: String, json: JSON) {
        identifier = key
        href = json["href"].stringValue
    }
}

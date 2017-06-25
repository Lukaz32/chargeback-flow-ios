//
//  ReasonDetail.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct ReasonDetail {
    public let id: String
    public let title: String
    public let response: Bool
    public var toDict: [String: Any] {
        var dict = [String: Any]()
        dict["id"] = id
        dict["title"] = title
        dict["response"] = response
        return dict
    }
}

extension ReasonDetail {
    public init(json: JSON) {
        id = json["id"].stringValue
        title = json["title"].stringValue
        response = json["response"].boolValue
    }
}

//
//  ChargebackOutput.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ChargebackOutput: BaseOutput {
    public let commentHint: String
    public let id: String
    public let title: String
    public let autoblock: Bool
    public let reasonDetails: [ReasonDetail]
    
    public override init(json: JSON) {
        commentHint = json["comment_hint"].stringValue
        id = json["id"].stringValue
        title = json["title"].stringValue
        autoblock = json["autoblock"].boolValue
        reasonDetails = json["reason_details"].map { ReasonDetail(json: $1) }
        super.init(json: json)
    }
}

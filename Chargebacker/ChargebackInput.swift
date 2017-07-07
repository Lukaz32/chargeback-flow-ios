//
//  ChargebackInput.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct ChargebackInput {
    public let comment: String
    public let reasonDetails: [ReasonDetail]
}

extension ChargebackInput {
    public init(json: JSON) {
        comment = json["comment"].stringValue
        reasonDetails = json["reason_details"].map { ReasonDetail(json: $1) }
    }
}

extension ChargebackInput: Input {
    public var toDict: [String: Any] {
        var dict = [String: Any]()
        dict["comment"] = comment
        dict["reason_details"] = reasonDetails.map { $0.toDict }
        return dict
    }
}

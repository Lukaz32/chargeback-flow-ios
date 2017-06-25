//
//  NoticeOutput.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import SwiftyJSON

public class NoticeOutput: BaseOutput {
    public let title: String
    public let description: String
    public let primaryAction: Action
    public let secondaryAction: Action
    
    public struct Action {
        let title: String
        let action: String
    }
    
    public override init(json: JSON) {
        title = json["title"].stringValue
        description = json["description"].stringValue
        primaryAction = Action(json: json["primary_action"])
        secondaryAction = Action(json: json["secondary_action"])
        super.init(json: json)
    }
}

extension NoticeOutput.Action {
    init(json: JSON) {
        title = json["title"].stringValue
        action = json["action"].stringValue
    }
}

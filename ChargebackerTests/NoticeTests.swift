//
//  CoreSpec.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Chargebacker
import SwiftyJSON

class NoticeTests: QuickSpec {
    
    override func spec() {
        
        let data = Mocker.mockedJsonData(for: "NoticeOutput")
        let output = NoticeOutput(json: JSON(data))
        
        describe("Notice Parsing") {
            it("the output contains the required attributes") {
                expect(output.primaryAction.action).to(equal("continue"))
                expect(output.secondaryAction.action).to(equal("cancel"))
                expect(output.title.isEmpty).notTo(beTrue())
                expect(output.description.isEmpty).notTo(beTrue())
            }
        }
    }
}

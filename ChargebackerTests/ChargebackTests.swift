//
//  ChargebackTests.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 25/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Chargebacker
import SwiftyJSON

class ChargebackTests: QuickSpec {
    
    override func spec() {
        
        let data = Mocker.mockedJsonData(for: "ChargebackOutput")
        let output = ChargebackOutput(json: JSON(data))
        
        describe("Chargeback Parsing") {
            it("the output contains the required attributes") {
                expect(output.commentHint.isEmpty).notTo(beTrue())
                expect(output.title.isEmpty).notTo(beTrue())
                expect(output.reasonDetails.count).to(equal(2))
            }
        }
    }
}

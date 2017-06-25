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
        
        describe("Chargeback Output Parsing") {
            it("contains the required attributes") {
                let data = Mocker.mockedJsonData(for: "ChargebackOutput")
                let output = ChargebackOutput(json: JSON(data))
                expect(output.commentHint.isEmpty).notTo(beTrue())
                expect(output.title.isEmpty).notTo(beTrue())
                expect(output.reasonDetails.count).to(equal(2))
            }
        }
        
        describe("Chargeback Input Parsing") {
            it("contains the required attributes") {
                let data = Mocker.mockedJsonData(for: "ChargebackInput")
                let input = ChargebackInput(json: JSON(data))
                expect(input.comment.isEmpty).to(beFalse())
                expect(input.reasonDetails.count).to(equal(2))
            }
        }
    }
}

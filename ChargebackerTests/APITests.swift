//
//  APITests.swift
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

class APITests: QuickSpec {
    
    override func spec() {
        
        let defaultTimeout: TimeInterval = 5
        let defaultPollInterval: TimeInterval = 0.5
        
        describe("Notice Data Fetching") {
            it("Should retrieve an output from the webservice") {
                var testOutput: NoticeOutput?
                API.Notice.getData(showSpinner: false, completion: { output, errorMessage in
                    testOutput = output
                })
                expect(testOutput).toEventuallyNot(beNil(), timeout: defaultTimeout, pollInterval: defaultPollInterval)
            }
        }
        
        describe("Chargeback Data Fetching") {
            it("Should retrieve an output from the webservice") {
                var testOutput: ChargebackOutput?
                API.Chargeback.getData(showSpinner: false, completion: { output, errorMessage in
                    testOutput = output
                })
                expect(testOutput).toEventuallyNot(beNil(), timeout: defaultTimeout, pollInterval: defaultPollInterval)
            }
        }
        
        describe("Card Blocking Request") {
            it("Should receive a 200 status code from the webservice") {
                var success = false
                API.Card.setCard(blocked: true, showSpinner: false, completion: { succeeded, _ in
                    success = succeeded
                })
                expect(success).toEventuallyNot(beTrue(), timeout: defaultTimeout, pollInterval: defaultPollInterval)
            }
        }
        
        describe("Card Unblocking Request") {
            it("Should receive a 200 status code from the webservice") {
                var success = false
                API.Card.setCard(blocked: false, showSpinner: false, completion: { succeeded, _ in
                    success = succeeded
                })
                expect(success).toEventuallyNot(beTrue(), timeout: defaultTimeout, pollInterval: defaultPollInterval)
            }
        }
        
        describe("Chargeback Operation") {
            it("Should receive a 200 status code from the webservice") {
                var success = false
                let data = Mocker.mockedJsonData(for: "ChargebackInput")
                let input = ChargebackInput(json: JSON(data))
                API.Chargeback.performChargebackOperation(input: input, showSpinner: false, completion: { succeeded, _ in
                    success = succeeded
                })
                expect(success).toEventuallyNot(beTrue(), timeout: defaultTimeout, pollInterval: defaultPollInterval)
            }
        }
    }
}

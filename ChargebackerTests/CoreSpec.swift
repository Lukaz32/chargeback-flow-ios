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
        
        let testBundle = Bundle(for: type(of: self))
        let fileURL = testBundle.url(forResource: "NoticeOutput", withExtension: "json")
        let data = try! Data(contentsOf: fileURL!)
        let output = NoticeOutput(json: JSON(data))

        
        describe("Notice Parsing") {
            it("the output provides the required actions") {
                expect(output.primaryAction.action).to(equal("continue"))
                expect(output.secondaryAction.action).to(equal("cancel"))
            }
        }
        
        describe("Notice Fetching") {
            it("Should retrieve valid data from the webservice") {
                var testOutput: NoticeOutput?
                API.Notice.getData(showSpinner: false, completion: { output, errorMessage in
                    testOutput = output
                })
                expect(testOutput).toEventuallyNot(beNil(), timeout: 3, pollInterval: 0.5)
            }
        }
        
    }
}

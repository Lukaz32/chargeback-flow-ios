//
//  GeneralTests.swift
//  Chargebacker
//
//  Created by Lucas M Pereira on 26/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Chargebacker
import SwiftyJSON

class GeneralTests: QuickSpec {
    
    override func spec() {
    
        var viewController: UIViewController!
        
        beforeEach {
            viewController = UIViewController(nibName: nil, bundle:nil)
            UIApplication.shared.keyWindow?.rootViewController = viewController
        }
        
        describe("General Alert Display") {
            it("Should display an alert on the topViewController with the correct message") {
                let message = "alert message"
                GeneralAlerter.displayErrorAlert(message: message)
                let presented = viewController.presentedViewController
                expect(presented).toEventually(beAnInstanceOf(UIAlertController.self))
                expect((presented as? UIAlertController)?.message).toEventually(equal(message))
            }
        }
        
        describe("HTML String conversion") {
            it("Correctly parses HTML string") {
                let size: CGFloat = 20
                let attString = Mocker.mockedHTMLString().attributedStringFromHTML(fontSize: size)
                expect(attString).notTo(beNil())
                let label = UILabel()
                label.attributedText = attString
                expect(label.font.pointSize).to(equal(size))
            }
        }
    }
}

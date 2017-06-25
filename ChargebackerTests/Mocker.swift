//
//  Mocker.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 25/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation

struct Mocker {
    static func mockedJsonData(for resourceName: String) -> Data {
        let testBundle = Bundle(for: type(of: APITests()))
        let fileURL = testBundle.url(forResource: resourceName, withExtension: "json")
        return try! Data(contentsOf: fileURL!)
    }
}

//
//  StringExtensions.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 25/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import UIKit

extension String {
    
    func attributedStringFromHTML(fontSize: CGFloat) -> NSAttributedString? {
        
        var string = self
        
        string.append("<style>body{font-family: \(ThemeHandler.mainRegularFont().fontName); font-size:\(fontSize);}</style>")
        
        return string.data(using: .utf8)?.attributedString
    }
}

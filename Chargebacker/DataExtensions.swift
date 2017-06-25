//
//  AttributedStringExtensions.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import UIKit

extension Data {
    
    var attributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options:[NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func attributedString(font: UIFont) -> NSAttributedString? {
        guard let attString = attributedString else { return nil }
        let newAttString = NSMutableAttributedString(attributedString: attString)
        newAttString.addAttributes([NSFontAttributeName: font], range: NSMakeRange(0, newAttString.string.characters.count - 1))
        return newAttString
    }
}

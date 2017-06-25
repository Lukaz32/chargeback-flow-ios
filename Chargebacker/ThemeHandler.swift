//
//  ThemeHandler.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import UIKit

struct ThemeHandler {
    
    static func purpleColor()       -> UIColor { return UIColor(hex: 0x6e2b77) }
    static func blackColor()        -> UIColor { return UIColor(hex: 0x222222) }
    static func hintColor()         -> UIColor { return UIColor(hex: 0x999999) }
    static func backgroundColor()   -> UIColor { return UIColor(hex: 0xfdfdfd) }
    static func greenColor()        -> UIColor { return UIColor(hex: 0x417505) }
    static func redColor()          -> UIColor { return UIColor(hex: 0xd5171b) }
    static func closeGrayColor()    -> UIColor { return UIColor(hex: 0x808191) }
    static func disabledGrayColor() -> UIColor { return UIColor(hex: 0xcccccc) }
    static func enabledPurpleColor()-> UIColor { return UIColor(hex: 0x6e2b77) }
    
    static func mainRegularFont(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: size) ?? UIFont.systemFont(ofSize:size)
    }
    
    static func mainBoldFont(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Bold", size: size) ?? UIFont.boldSystemFont(ofSize:size)
    }
}

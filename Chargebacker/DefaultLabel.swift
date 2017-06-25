//
//  DefaultLabel.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import UIKit

class DefaultLabel: UILabel {

    // MARK: Properties
    
    @IBInspectable var isTitle: Bool = false
    @IBInspectable var isBold: Bool = false
    @IBInspectable var indicatesCaution: Bool = false
    
    // MARK: View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    private func setupLayout() {
        let size = font.pointSize
        font = isBold ? ThemeHandler.mainBoldFont(size: size) :ThemeHandler.mainRegularFont(size: size)
        textColor = isTitle ? ThemeHandler.purpleColor() : ThemeHandler.blackColor()
        if indicatesCaution { textColor = ThemeHandler.redColor() }
    }
}

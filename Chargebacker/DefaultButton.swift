//
//  DefaultButton.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import UIKit

class DefaultButton: UIButton {

    // MARK: Properties
    
    @IBInspectable var isColored: Bool = false
    
    // MARK: Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    private func setupLayout() {
        let color = isColored ? ThemeHandler.purpleColor() : ThemeHandler.closeGrayColor()
        setTitleColor(color, for: .normal)
        setTitleColor(ThemeHandler.disabledGrayColor(), for: .highlighted)
        titleLabel?.font = ThemeHandler.mainBoldFont(size: 18)
        setTitle(titleLabel?.text?.uppercased(), for: .normal)
    }
}

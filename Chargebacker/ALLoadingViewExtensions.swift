//
//  ALLoadingViewExtensions.swift
//  Chargebacker
//
//  Created by Lucas M Pereira on 07/07/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation
import ALLoadingView

extension ALLoadingView {
    static func show() {
        ALLoadingView.manager.showLoadingView(ofType: .basic, windowMode: .fullscreen)
    }
    static func hide() {
        ALLoadingView.manager.hideLoadingView()
    }
}

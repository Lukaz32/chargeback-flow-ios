//
//  GeneralAlerter.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import UIKit

struct GeneralAlerter {
    
    static let defaultTitle = "Ops"
    static let defaultMessage = API.genericErrorMessage
    
    static func displayErrorAlert(message: String? = defaultMessage) {
        let alert = UIAlertController(title: defaultTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        topViewController()?.present(alert, animated: true, completion: nil)
    }
    
    static func topViewController() -> UIViewController? {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
}

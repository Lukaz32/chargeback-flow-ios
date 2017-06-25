//
//  ModalAlertViewController.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import UIKit

fileprivate let strings = R.string.modalAlert.self

class ModalAlertViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var lblTitle: UILabel! {
        didSet {  lblTitle.text = strings.title() }
    }
    @IBOutlet weak var lblDescription: UILabel! {
        didSet { lblDescription.text = strings.descriptionText() }
    }
    
    // MARK: Properties
    
    var completion: (() -> Void)?
    
    // MARK: View Life Cycle
    
    init(completion: (() -> Void)?) {
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: IBActions
    
    @IBAction func tappedDismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: completion)
    }
}

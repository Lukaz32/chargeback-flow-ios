//
//  NoticeViewController.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright (c) 2017 Lucas Pereira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NoticeDisplayLogic: class {
    func displayData(viewModel: Notice.Data.ViewModel)
    func proceedToChargebackScene(viewModel: Chargeback.Data.ViewModel)
}

fileprivate let segues = R.segue.noticeViewController.self

class NoticeViewController: UIViewController, NoticeDisplayLogic {
    var interactor: NoticeBusinessLogic?
    
    // MARK: IBOutlets
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnPrimaryAction: UIButton!
    @IBOutlet weak var btnSecondaryAction: UIButton!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = NoticeInteractor()
        let presenter = NoticePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == segues.chargebackView.identifier,
            let viewModel = sender as? Chargeback.Data.ViewModel,
            let chargebackViewController = segue.destination as? ChargebackViewController {
            chargebackViewController.loadView()
            chargebackViewController.displayData(viewModel: viewModel)
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNoticeData()
    }
    
    // MARK: Private API
    
    private func loadNoticeData() {
        interactor?.fetchData()
    }
    
    // MARK: Display Logic
    
    func displayData(viewModel: Notice.Data.ViewModel) {
        lblTitle.text = viewModel.title
        lblDescription.attributedText = viewModel.description.attributedStringFromHTML(fontSize: 16)
        btnPrimaryAction.setTitle(viewModel.primaryAction.title.uppercased(), for: .normal)
        btnSecondaryAction.setTitle(viewModel.secondaryAction.title.uppercased(), for: .normal)
    }
    
    func proceedToChargebackScene(viewModel: Chargeback.Data.ViewModel) {
        performSegue(withIdentifier: segues.chargebackView.identifier, sender: viewModel)
    }
    
    // MARK: IBActions
    
    @IBAction func tappedPrimaryAction(_ sender: Any) {
        interactor?.handlePrimaryAction()
    }
    
    @IBAction func tappedSecondaryAction(_ sender: Any) {
        // Does nothing for now.
    }
    
}

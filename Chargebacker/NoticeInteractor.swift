//
//  NoticeInteractor.swift
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

protocol NoticeBusinessLogic
{
    func fetchData(request: Notice.Data.Request)
    func handlePrimaryAction()
}

protocol NoticeDataStore
{
    //var name: String { get set }
}

class NoticeInteractor: NoticeBusinessLogic, NoticeDataStore
{
    var presenter: NoticePresentationLogic?
    
    func fetchData(request: Notice.Data.Request)
    {
        API.Notice.getData { [weak self] output, errorMessage in
            guard let output = output else {
                GeneralAlerter.displayErrorAlert(message: errorMessage)
                return
            }
            let response = Notice.Data.Response(output: output)
            self?.presenter?.presentNoticeData(response: response)
        }
    }
    
    func handlePrimaryAction() {
        API.Chargeback.getData { [weak self] output, errorMessage in
            guard let output = output else {
                GeneralAlerter.displayErrorAlert(message: errorMessage)
                return
            }
            let viewModel = Chargeback.Data.ViewModel(title: output.title,
                                                      hint: output.commentHint,
                                                      autoblock: output.autoblock,
                                                      reasonDetails: output.reasonDetails)
            self?.presenter?.proceedToChargebackScene(viewModel: viewModel)
        }
    }
}
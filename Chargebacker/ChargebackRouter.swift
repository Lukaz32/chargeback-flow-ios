//
//  ChargebackRouter.swift
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

@objc protocol ChargebackRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ChargebackDataPassing
{
  var dataStore: ChargebackDataStore? { get }
}

class ChargebackRouter: NSObject, ChargebackRoutingLogic, ChargebackDataPassing
{
  weak var viewController: ChargebackViewController?
  var dataStore: ChargebackDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: ChargebackViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: ChargebackDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}

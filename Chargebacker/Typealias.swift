//
//  Typealias.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 24/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation

// MARK: Closures

public typealias ReturnBaseOutput = (BaseOutput?, String?) -> Void
public typealias ReturnNoticeOutput = (NoticeOutput?, String?) -> Void
public typealias ReturnChargebackOutput = (ChargebackOutput?, String?) -> Void
public typealias ReturnBoolOutput = (Bool, String?) -> Void

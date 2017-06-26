//
//  Mocker.swift
//  Chargebacker
//
//  Created by Lucas Pereira on 25/06/17.
//  Copyright © 2017 Lucas Pereira. All rights reserved.
//

import Foundation

struct Mocker {
    static func mockedJsonData(for resourceName: String) -> Data {
        let testBundle = Bundle(for: type(of: APITests()))
        let fileURL = testBundle.url(forResource: resourceName, withExtension: "json")
        return try! Data(contentsOf: fileURL!)
    }
    
    static func mockedHTMLString() -> String {
        return "<p>Estamos com você nesta! Certifique-se dos pontos abaixo, são muito importantes:<br/><strong>• Você pode <font color=\"#6e2b77\">procurar o nome do estabelecimento no Google</font>. Diversas vezes encontramos informações valiosas por lá e elas podem te ajudar neste processo.</strong><br/><strong>• Caso você reconheça a compra, é muito importante pra nós que entre em contato com o estabelecimento e certifique-se que a situação já não foi resolvida.</strong></p>"
    }
}

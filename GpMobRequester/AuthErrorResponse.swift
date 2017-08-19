//
//  AuthErrorResponse.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire
import SwiftyJSON

struct AuthErrorResponse: Retrofire.Mappable {
    private let codigo: Int?
    private let mensagem: String?
    
    func getCodigo() -> Int? {
        return codigo
    }
    
    func getMensagem() -> String? {
        return mensagem
    }
    
    public static func instanceBy<M>(json: JSON) -> M {
        let codigo = json.dictionary?[APIField.codigo]?.intValue
        let mensagem = json.dictionary?[APIField.mensagem]?.stringValue
        
        return AuthErrorResponse(codigo: codigo,
                            mensagem: mensagem
            ) as! M
    }
    
    private struct APIField {
        static let codigo   = "codigo"
        static let mensagem = "mensagem"
    }
    
}


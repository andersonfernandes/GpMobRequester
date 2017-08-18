//
//  AuthResponse.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire
import SwiftyJSON

struct AuthSolicitationResponse: Retrofire.Mappable {
    private let idAutorizacao: Int?
    private let urlAutorizacao: String?
    
    func getIdAutorizacao() -> Int? {
        return idAutorizacao
    }
    
    func getUrlAutorizacao() -> String? {
        return urlAutorizacao
    }
    
    public static func instanceBy<M>(json: JSON) -> M {
        let idAutorizacao = json.dictionary?[APIField.idAutorizacao]?.intValue
        let urlAutorizacao = json.dictionary?[APIField.urlAutorizacao]?.stringValue
        
        return AuthSolicitationResponse(idAutorizacao: idAutorizacao,
                            urlAutorizacao: urlAutorizacao
        ) as! M
    }
    
    private struct APIField {
        static let idAutorizacao  = "idAutorizacao"
        static let urlAutorizacao = "urlAutorizacao"
    }
}

//
//  File.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

struct AuthRequest {
    let login: String
    let idAutorizacao: Int
    let tokenApp: String = "7f091ff91d0d896809ae2ac13632627a7473334a"
    
    init(login: String, idAutorizacao: Int) {
        self.login          = login
        self.idAutorizacao  = idAutorizacao
    }
    
    func asBodyParameters() -> [String: Any?] {
        return [
            APIField.login:         login,
            APIField.idAutorizacao: idAutorizacao,
            APIField.tokenApp:      tokenApp
        ]
    }
    
    private struct APIField {
        static let login            = "login"
        static let idAutorizacao    = "idAutorizacao"
        static let tokenApp         = "tokenApp"
    }
    
}

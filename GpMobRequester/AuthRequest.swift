//
//  AuthRequest.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

struct AuthRequest {
    let login: String
    let nomeDispositivo: String
    let tokenApp: String = "7f091ff91d0d896809ae2ac13632627a7473334a"
    
    init(login: String, nomeDispositivo: String) {
        self.login           = login
        self.nomeDispositivo = nomeDispositivo
    }
    
    func asBodyParameters() -> [String: Any?] {
        return [
            APIField.login:           login,
            APIField.nomeDispositivo: nomeDispositivo,
            APIField.tokenApp:        tokenApp
        ]
    }
    
    private struct APIField {
        static let login           = "login"
        static let nomeDispositivo = "nomeDispositivo"
        static let tokenApp        = "tokenApp"
    }
    
}

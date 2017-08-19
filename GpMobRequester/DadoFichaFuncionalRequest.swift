//
//  DadoFichaFuncionalRequest.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

struct DadoFichaFuncionalRequest {
    let descricao: String
    let tipoDadoFichaFuncional: Int
    
    init(descricao: String, tipoDadoFichaFuncional: Int) {
        self.descricao              = descricao
        self.tipoDadoFichaFuncional = tipoDadoFichaFuncional
    }
    
    func asBodyParameters() -> [String: Any?] {
        return [
            APIField.descricao:                 descricao,
            APIField.tipoDadoFichaFuncional:    tipoDadoFichaFuncional,
        ]
    }
    
    private struct APIField {
        static let descricao                = "descricao"
        static let tipoDadoFichaFuncional   = "tipoDadoFichaFuncional"
    }
}

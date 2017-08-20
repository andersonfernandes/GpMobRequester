//
//  DadoFichaFuncionalAnexoRequest.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 20/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

struct DadoFichaFuncionalAnexoRequest {
    let id: Int
    let anexo: String
    
    init(id: Int, anexo: String) {
        self.id = id
        self.anexo = anexo
    }
    
    func asBodyParameters() -> [String: Any?] {
        return [
            APIField.id:    id,
            APIField.anexo: anexo,
        ]
    }
    
    private struct APIField {
        static let id       = "id"
        static let anexo    = "anexo"
    }
    
}

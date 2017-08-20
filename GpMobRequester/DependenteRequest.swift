//
//  DependenteDto.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 20/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

struct DependenteRequest {
    
    let cpf: String
    let nome: String
    let rg: String
    let tipoParentesco: Int
    let codigoTipoSexo: String
    let dataNascimento: String
    
    init(cpf: String, nome: String, rg: String, tipoParentesco: Int, codigoTipoSexo: String, dataNascimento: String) {
        
        self.cpf = cpf
        self.nome = nome
        self.rg = rg
        self.tipoParentesco = tipoParentesco
        self.codigoTipoSexo = codigoTipoSexo
        self.dataNascimento = dataNascimento
    }
    
    func asBodyParameters() -> [String: Any?] {
        return [
            APIField.cpf:               cpf,
            APIField.nome:              nome,
            APIField.rg:                rg,
            APIField.tipoParentesco:    tipoParentesco,
            APIField.codigoTipoSexo:    codigoTipoSexo,
            APIField.dataNascimento:    dataNascimento,
        ]
    }
    
    private struct APIField {
        static let cpf              = "cpf"
        static let nome             = "nome"
        static let rg               = "rg"
        static let tipoParentesco   = "tipoParentesco"
        static let codigoTipoSexo   = "codigoTipoSexo"
        static let dataNascimento   = "dataNascimento"
    }
    
}

//
//  Dependente.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire
import SwiftyJSON

struct Dependente: Retrofire.Mappable {
    private let id: Int?
    private let idDependenteOrigem: Int?
    private let numeroPessoaFuncionario: Int?
    private let tipoStatus: String?
    private let numeroPessoaInclusao: Int?
    private let numeroPessoaAlteracao: Int?
    private let dataInclusao: Int?
    private let dataAlteracao: Int?
    private let nome: String?
    private let tipoParentesco: TipoParentesco?
    private let cpf: String?
    private let rg: String?
    
    func getNome() -> String? {
        return nome
    }
    
    func getCpf() -> String? {
        return cpf
    }
    
    func getRg() -> String? {
        return rg
    }
    
    func getParentesco() -> String? {
        return tipoParentesco?.getNome()
    }
    
    public static func instanceBy<M>(json: JSON) -> M {
        let id                              = json.dictionary?[APIField.id]?.intValue
        let idDependenteOrigem              = json.dictionary?[APIField.idDependenteOrigem]?.intValue
        let numeroPessoaFuncionario         = json.dictionary?[APIField.numeroPessoaFuncionario]?.intValue
        let tipoStatus                      = json.dictionary?[APIField.tipoStatus]?.stringValue
        let numeroPessoaInclusao            = json.dictionary?[APIField.numeroPessoaInclusao]?.intValue
        let numeroPessoaAlteracao           = json.dictionary?[APIField.numeroPessoaAlteracao]?.intValue
        let dataInclusao                    = json.dictionary?[APIField.dataInclusao]?.intValue
        let dataAlteracao                   = json.dictionary?[APIField.dataAlteracao]?.intValue
        let nome                            = json.dictionary?[APIField.nome]?.stringValue
        let cpf                            = json.dictionary?[APIField.cpf]?.stringValue
        let rg                            = json.dictionary?[APIField.rg]?.stringValue
        
        let tipoParentescoJSON: JSON?       = json.dictionary?[APIField.tipoParentesco]
        var tipoParentesco: TipoParentesco?
        
        if let json = tipoParentescoJSON {
            tipoParentesco = TipoParentesco.instanceBy(json: json)
        }

        return Dependente(id: id,
                          idDependenteOrigem: idDependenteOrigem,
                          numeroPessoaFuncionario: numeroPessoaFuncionario,
                          tipoStatus: tipoStatus,
                          numeroPessoaInclusao: numeroPessoaInclusao,
                          numeroPessoaAlteracao: numeroPessoaAlteracao,
                          dataInclusao: dataInclusao,
                          dataAlteracao: dataAlteracao,
                          nome: nome,
                          tipoParentesco: tipoParentesco,
                          cpf: cpf,
                          rg: rg
                          ) as! M
    }
    
    private struct APIField {
        static let id                       = "id"
        static let idDependenteOrigem       = "idDependenteOrigem"
        static let numeroPessoaFuncionario  = "numeroPessoaFuncionario"
        static let tipoStatus               = "tipoStatus"
        static let numeroPessoaInclusao     = "numeroPessoaInclusao"
        static let numeroPessoaAlteracao    = "numeroPessoaAlteracao"
        static let dataInclusao             = "dataInclusao"
        static let dataAlteracao            = "dataAlteracao"
        static let nome                     = "nome"
        static let tipoParentesco           = "tipoParentesco"
        static let cpf                      = "cpf"
        static let rg                       = "rg"
    }
    
}

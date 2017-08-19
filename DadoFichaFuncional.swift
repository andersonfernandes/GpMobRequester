//
//  DadoFichaFuncional.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire
import SwiftyJSON

struct DadoFichaFuncional: Retrofire.Mappable {
    private let id: Int?
    private let numeroPessoaFuncionario: Int?
    private let tipoStatus: String?
    private let numeroPessoaInclusao: Int?
    private let numeroPessoaAlteracao: Int?
    private let dataInclusao: Int?
    private let dataAlteracao: Int?
    private let descricao: String?
    private let tipoDadoFichaFuncional: TipoDadoFichaFuncional?
    private let tipo: String?
    
    public static func instanceBy<M>(json: JSON) -> M {
        let id                      = json.dictionary?[APIField.id]?.intValue
        let numeroPessoaFuncionario = json.dictionary?[APIField.numeroPessoaFuncionario]?.intValue
        let tipoStatus              = json.dictionary?[APIField.tipoStatus]?.stringValue
        let numeroPessoaInclusao    = json.dictionary?[APIField.numeroPessoaInclusao]?.intValue
        let numeroPessoaAlteracao   = json.dictionary?[APIField.numeroPessoaAlteracao]?.intValue
        let dataInclusao            = json.dictionary?[APIField.dataInclusao]?.intValue
        let dataAlteracao           = json.dictionary?[APIField.dataAlteracao]?.intValue
        let descricao               = json.dictionary?[APIField.descricao]?.stringValue
        let tipo                    = json.dictionary?[APIField.tipo]?.stringValue
        
        let tipoDadoFichaFuncionalJSON: JSON? = json.dictionary?[APIField.tipoDadoFichaFuncional]
        var tipoDadoFichaFuncional: TipoDadoFichaFuncional?
        
        if let json = tipoDadoFichaFuncionalJSON {
            tipoDadoFichaFuncional = TipoDadoFichaFuncional.instanceBy(json: json)
        }
        
        return DadoFichaFuncional(id: id,
                                  numeroPessoaFuncionario: numeroPessoaFuncionario,
                                  tipoStatus: tipoStatus,
                                  numeroPessoaInclusao: numeroPessoaInclusao,
                                  numeroPessoaAlteracao: numeroPessoaAlteracao,
                                  dataInclusao: dataInclusao,
                                  dataAlteracao: dataAlteracao,
                                  descricao: descricao,
                                  tipoDadoFichaFuncional: tipoDadoFichaFuncional,
                                  tipo: tipo
        ) as! M
    }
    
    func getTipoDadoFichaFuncional() -> TipoDadoFichaFuncional? {
        return tipoDadoFichaFuncional
    }
    
    func getDescricao() -> String? {
        return descricao
    }
    
    private struct APIField {
        static let id                      = "id"
        static let numeroPessoaFuncionario = "numeroPessoaFuncionario"
        static let tipoStatus              = "tipoStatus"
        static let numeroPessoaInclusao    = "numeroPessoaInclusao"
        static let numeroPessoaAlteracao   = "numeroPessoaAlteracao"
        static let dataInclusao            = "dataInclusao"
        static let dataAlteracao           = "dataAlteracao"
        static let descricao               = "descricao"
        static let tipoDadoFichaFuncional  = "tipoDadoFichaFuncional"
        static let tipo                    = "tipo"
    }
}

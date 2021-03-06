//
//  TipoDadoFichaFuncional.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire
import SwiftyJSON

struct TipoDadoFichaFuncional: Retrofire.Mappable {
    private let id: Int?
    private let nome: String?
    private let nomeTipo: String?
    private let grupoTipo: GrupoTipo?
    private let numeroPessoaInclusao: Int?
    
    public static func instanceBy<M>(json: JSON) -> M {
        let id                      = json.dictionary?[APIField.id]?.intValue
        let nome = json.dictionary?[APIField.nome]?.stringValue
        let nomeTipo = json.dictionary?[APIField.nomeTipo]?.stringValue
        let numeroPessoaInclusao = json.dictionary?[APIField.numeroPessoaInclusao]?.intValue
        
        let grupoTipoJSON: JSON? = json.dictionary?[APIField.grupoTipo]
        var grupoTipo: GrupoTipo?
        
        if let json = grupoTipoJSON {
            grupoTipo = GrupoTipo.instanceBy(json: json)
        }
        
        
        return TipoDadoFichaFuncional(id: id,
                                      nome: nome,
                                      nomeTipo: nomeTipo,
                                      grupoTipo: grupoTipo,
                                      numeroPessoaInclusao: numeroPessoaInclusao
        ) as! M
    }
    
    func getId() -> Int? {
        return id
    }
    
    func getNome() -> String? {
        return nome
    }
    
    func getNomeTipo() -> String? {
        return nomeTipo
    }
    
    private struct APIField {
        static let id                   = "id"
        static let nome                 = "nome"
        static let nomeTipo             = "nomeTipo"
        static let grupoTipo            = "grupoTipo"
        static let numeroPessoaInclusao = "numeroPessoaInclusao"
    }
}

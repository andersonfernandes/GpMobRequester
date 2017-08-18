//
//  GrupoTipo.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire
import SwiftyJSON

struct GrupoTipo: Retrofire.Mappable {
    private let id: Int?
    private let nomeGrupoTipo: String?
    private let numeroPessoaInclusao: Int?
    
    public static func instanceBy<M>(json: JSON) -> M {
        let id = json.dictionary?[APIField.id]?.intValue
        let nomeGrupoTipo = json.dictionary?[APIField.nomeGrupoTipo]?.stringValue
        let numeroPessoaInclusao = json.dictionary?[APIField.numeroPessoaInclusao]?.intValue
        
        return GrupoTipo(id: id, nomeGrupoTipo: nomeGrupoTipo, numeroPessoaInclusao: numeroPessoaInclusao) as! M
    }
    
    private struct APIField {
        static let id = "id"
        static let nomeGrupoTipo = "nomeGrupoTipo"
        static let numeroPessoaInclusao = "numeroPessoaInclusao"
    }

}

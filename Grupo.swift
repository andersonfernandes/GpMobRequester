//
//  Grupo.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire
import SwiftyJSON

struct Grupo: Retrofire.Mappable {
    private let descricao: String?
    private let dados: [DadoFichaFuncional]?
    
    public static func instanceBy<M>(json: JSON) -> M {
        let descricao = json.dictionary?[APIField.descricao]?.stringValue
        
        let dadosJson: [JSON]? = json.dictionary?[APIField.dados]?.array
        var dados = [DadoFichaFuncional]()
        
        dadosJson?.forEach { dadoJSON in
                        dados.append(DadoFichaFuncional.instanceBy(json: dadoJSON))
        }
        
        return Grupo(descricao: descricao,
                     dados: dados
            ) as! M
    }
    
    func getDescricao() -> String? {
        return descricao
    }
    
    func getDados() -> [DadoFichaFuncional]? {
        return dados
    }
    
    private struct APIField {
        static let descricao = "descricao"
        static let dados     = "dados"
    }
}

//
//  TipoParentesco.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire
import SwiftyJSON

struct TipoParentesco: Retrofire.Mappable {
    private let codigo: Int?
    private let nome: String?
    
    public static func instanceBy<M>(json: JSON) -> M {
        let codigo  = json.dictionary?[APIField.codigo]?.intValue
        let nome    = json.dictionary?[APIField.nome]?.stringValue
        
        return TipoParentesco(codigo: codigo,
                              nome: nome
            ) as! M
    }
    
    private struct APIField {
        static let codigo   = "codigo"
        static let nome     = "nome"
    }

    
}

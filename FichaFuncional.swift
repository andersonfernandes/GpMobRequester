//
//  FichaFuncional.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire
import SwiftyJSON

struct FichaFuncional: Retrofire.Mappable {
    private let nomeFuncionario: String?
    private let dependentes: [Dependente]?
    private let grupos: [Grupo]?
    
    public static let USER_TOKEN_PREFERENCE: String = "USER_TOKEN"
    
    public static func instanceBy<M>(json: JSON) -> M {
        let nomeFuncionario = json.dictionary?[APIField.nomeFuncionario]?.stringValue
        
        let dependentesJson: [JSON]? = json.dictionary?[APIField.dependentes]?.array
        var dependentes = [Dependente]()
        
        dependentesJson?.forEach { dependenteJSON in
            dependentes.append(Dependente.instanceBy(json: dependenteJSON))
        }
        
        let gruposJson: [JSON]? = json.dictionary?[APIField.grupos]?.array
        var grupos = [Grupo]()
        gruposJson?.forEach { grupoJSON in
            grupos.append(Grupo.instanceBy(json: grupoJSON))
        }
        
        return FichaFuncional(nomeFuncionario: nomeFuncionario,
                              dependentes: [Dependente](),
                              grupos: [Grupo]()
            ) as! M
    }
    
    private struct APIField {
        static let nomeFuncionario = "nomeFuncionario"
        static let dependentes     = "dependentes"
        static let grupos          = "grupos"
    }
}

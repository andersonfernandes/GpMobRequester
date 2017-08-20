//
//  FichaFuncionalResponse.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire
import SwiftyJSON

struct FichaFuncionalResponse: Retrofire.Mappable {
    private let nomeFuncionario: String?
    private let dependentes: [Dependente]?
    private let grupos: [Grupo]?
    
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
        
        return FichaFuncionalResponse(nomeFuncionario: nomeFuncionario,
                              dependentes: dependentes,
                              grupos: grupos
            ) as! M
    }
    
    func getNomeFuncionario() -> String? {
        return nomeFuncionario
    }
    
    func getDependentes() -> [Dependente]? {
        return dependentes
    }
    
    func getGrupos() -> [Grupo]? {
        return grupos
    }
    
    private struct APIField {
        static let nomeFuncionario = "nomeFuncionario"
        static let dependentes     = "dependentes"
        static let grupos          = "grupos"
    }
}
//
//  DadoFichaFuncionalResponse.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire
import SwiftyJSON

struct DadoFichaFuncionalResponse: Retrofire.Mappable {
    private let id: Int?
    private let tipoStatus: String?
    
    func getId() -> Int? {
        return id
    }
    
    func getTipoStatus() -> String? {
        return tipoStatus
    }
    
    public static func instanceBy<M>(json: JSON) -> M {
        let id = json.dictionary?[APIField.id]?.intValue
        let tipoStatus = json.dictionary?[APIField.tipoStatus]?.stringValue
        
        return DadoFichaFuncionalResponse(id: id, tipoStatus: tipoStatus
        ) as! M
    }
    
    private struct APIField {
        static let id           = "id"
        static let tipoStatus   = "tipoStatus"
    }
}

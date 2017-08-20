//
//  DadoFichaFuncionalAnexoResponse.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 20/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire
import SwiftyJSON

struct DadoFichaFuncionalAnexoResponse: Retrofire.Mappable {
    private let anexo: String?
    
    func getAnexo() -> String? {
        return anexo
    }
    
    public static func instanceBy<M>(json: JSON) -> M {
        let anexo = json.dictionary?[APIField.anexo]?.stringValue
        
        return DadoFichaFuncionalAnexoResponse(anexo: anexo) as! M
    }
    
    private struct APIField {
        static let anexo = "anexo"
    }
}

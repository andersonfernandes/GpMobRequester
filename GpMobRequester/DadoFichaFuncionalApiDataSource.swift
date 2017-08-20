//
//  DadoFichaFuncionalApiDataSource.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire

protocol DadoFichaFuncionalApiDataSource {
    var authorizePath: String { get }
    
    func insert(userToken: String?, dadoFichaFuncionalRequest: DadoFichaFuncionalRequest) -> Call<DadoFichaFuncionalResponse>
    
    func insertAttachment(userToken: String?, dadoFichaFuncionalAnexoRequest: DadoFichaFuncionalAnexoRequest) -> Call<DadoFichaFuncionalAnexoResponse>
}

extension DadoFichaFuncionalApiDataSource {
    var authorizePath: String { return "/sfz_ficha_funcional_api/api/public/dadoFichaFuncional/anexo" }
}

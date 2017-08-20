//
//  DadoFichaFuncionalApiDataSourceImpl.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire

class DadoFichaFuncionalApiDataSourceImpl: RemoteBase, DadoFichaFuncionalApiDataSource {
    private static var INSTANCE: DadoFichaFuncionalApiDataSourceImpl?
    
    static func getInstance() -> DadoFichaFuncionalApiDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = DadoFichaFuncionalApiDataSourceImpl()
        }
        
        return INSTANCE!
    }
    
    func insert(userToken: String?, dadoFichaFuncionalRequest: DadoFichaFuncionalRequest) -> Call<DadoFichaFuncionalResponse> {
        let path = RemoteUtils.buildUrl(path: authorizePath)
        let header = ["Authorization": "Bearer " + (userToken ?? "")]
        
        let request = RequestBuilder(path: path)
            .headers(header)
            .method(.post)
            .bodyParameters(dadoFichaFuncionalRequest.asBodyParameters())
            .build()
        return self.callSingle(request: request)
    }
    
    func insertAttachment(userToken: String?, dadoFichaFuncionalAnexoRequest: DadoFichaFuncionalAnexoRequest) -> Call<DadoFichaFuncionalAnexoResponse> {
        let path = RemoteUtils.buildUrl(path: authorizePath)
        let header = ["Authorization": "Bearer " + (userToken ?? "")]
        
        let request = RequestBuilder(path: path)
            .headers(header)
            .method(.post)
            .bodyParameters(dadoFichaFuncionalAnexoRequest.asBodyParameters())
            .build()
        return self.callSingle(request: request)
    }
    
}

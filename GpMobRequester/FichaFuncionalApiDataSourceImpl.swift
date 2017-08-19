//
//  FichaFuncionalApiDataSourceImpl.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire

class FichaFuncionalApiDataSourceImpl: RemoteBase, FichaFuncionalApiDataSource {
    private static var INSTANCE: FichaFuncionalApiDataSourceImpl?
    private let sessionLocalDataSource: SessionLocalDataSource = SessionLocalDataSource.getInstance()
    
    static func getInstance() -> FichaFuncionalApiDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = FichaFuncionalApiDataSourceImpl()
        }
        
        return INSTANCE!
    }
    
    func get() -> Call<FichaFuncionalResponse> {
        let path = RemoteUtils.buildUrl(path: authorizePath)
        let header = ["Authorization": "Bearer " + sessionLocalDataSource.getUserToken()]
        
        let request = RequestBuilder(path: path)
            .headers(headers: headers)
            .bodyParameters(authRequest.asBodyParameters())
            .build()
        
        return self.callSingle(request: request)
    }
    
}

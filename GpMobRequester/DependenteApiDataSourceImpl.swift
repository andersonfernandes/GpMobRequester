//
//  DependenteApiDataSourceImpl.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 20/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire

class DependenteApiDataSourceImpl: RemoteBase, DependenteApiDataSource {
    private static var INSTANCE: DependenteApiDataSourceImpl?
    
    static func getInstance() -> DependenteApiDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = DependenteApiDataSourceImpl()
        }
        
        return INSTANCE!
    }
    
    func insert(userToken: String?, dependenteRequest: DependenteRequest) -> Call<DependenteResponse> {
    
        let path = RemoteUtils.buildUrl(path: authorizePath)
        let header = ["Authorization": "Bearer " + (userToken ?? "")]
        
        let request = RequestBuilder(path: path)
            .headers(header)
            .method(.post)
            .bodyParameters(dependenteRequest.asBodyParameters())
            .build()
        return self.callSingle(request: request)    }
    
}

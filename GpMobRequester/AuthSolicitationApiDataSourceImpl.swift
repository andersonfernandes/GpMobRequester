//
//  AuthApiDataSourceImpl.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire

class AuthSolicitationApiDataSourceImpl: RemoteBase, AuthSolicitationApiDataSource {
    private static var INSTANCE: AuthSolicitationApiDataSourceImpl?
    
    static func getInstance() -> AuthSolicitationApiDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = AuthSolicitationApiDataSourceImpl()
        }
        
        return INSTANCE!
    }
    
    func requestAuthorization(authRequest: AuthSolicitationRequest) -> Call<AuthSolicitationResponse> {
        let path = RemoteUtils.buildUrl(path: authorizePath)
        let request = RequestBuilder(path: path)
            .method(.post)
            .bodyParameters(authRequest.asBodyParameters())
            .build()
        return self
            .callSingle(request: request)
    }
    
}




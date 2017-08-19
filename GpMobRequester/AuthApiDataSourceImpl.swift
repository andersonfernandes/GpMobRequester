//
//  AuthApiDataSourceImpl.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire

class AuthApiDataSourceImpl: RemoteBase, AuthApiDataSource {
    private static var INSTANCE: AuthApiDataSourceImpl?
    
    static func getInstance() -> AuthApiDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = AuthApiDataSourceImpl()
        }
        
        return INSTANCE!
    }
    
    func authorize(authRequest: AuthRequest) -> Call<AuthResponse> {
        let path = RemoteUtils.buildUrl(path: authorizePath)
        
        let request = RequestBuilder(path: path)
            .method(.post)
            .bodyParameters(authRequest.asBodyParameters())
            .build()
        
        return self.callSingle(request: request)
    }
    
}

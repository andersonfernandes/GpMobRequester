//
//  AuthApiDataSourceImpl.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

import Quick
import Nimble
import Retrofire
@testable import GpMobRequester

/**
 Unit tests for the implementation of {@link AuthApiDataSourceImpl}
 */
class AuthApiDataSourceImplTest: QuickSpec {
    
    override func spec() {
        
        let login               = "24006664"
        var idAutorizacao       = 134
        let authApiDataSource   = AuthApiDataSourceImpl.getInstance()
        var authRequest         = AuthRequest(login: login, idAutorizacao: idAutorizacao)
        
        describe("Authorizing an user") {
            context("When authorize with success") {
                var authResponseResult: AuthResponse?
                
                it("Should return a valid authResponse") {
                    authApiDataSource.authorize(authRequest: authRequest)
                        .onSuccess() { response in
                            authResponseResult = response
                        }
                        .onFailed() { e in }
                        .call()
                    expect(authResponseResult?.getIdToken()).toEventually(equal("eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyNDAwNjY2NCIsImF1dGgiOiJST0xFX0VNSV9FWFRSQVRPLFJPTEVfUkVMX0RFTlVOX0VTUE9OVEFORUEsUk9MRV9FTUlfQ1AsUk9MRV9SRUxfT01JU1NBTyIsImlkQ29uZXhhbyI6IjAzQjU1Mzg3RUM0QzMzNEYyNUI0NTIzREYzQjYyNUZBIiwibnVtUGVzc29hIjoyNjQ4LCJpbmRTdGF0dXMiOiJBIiwiaWRBcGxpY2F0aXZvIjozMCwiaWRBdXRvcml6YWNhbyI6MTM0LCJleHAiOjE1MTg5OTg0MDB9.kX3fVcVvjRRwKimso0pgjYAt1_tsyqEBs9TZAtuWJGX-l-5fOyFtGTq5WODcvkX8kn9e27DApsGV4fYT6patKQ"))
                }
            }
        
            context("When the idAutorizacao is invalid") {
                var authErrorResponseResult: ErrorResponse?
                
                beforeEach {
                    idAutorizacao = 1111
                    
                    authRequest = AuthRequest(login: login, idAutorizacao: idAutorizacao)
                }
                
                it("Should return an not authorized error") {
                    authApiDataSource.authorize(authRequest: authRequest)
                        .onFailed() { e in
                            authErrorResponseResult = e as? ErrorResponse
                        }
                        .call()
                    
                    expect(authErrorResponseResult?.statusCode).toEventually(equal(401))
                    expect(authErrorResponseResult?.detailMessage).toEventually(equal("{\n    codigo = 2;\n    mensagem = \"Autoriza\\U00e7\\U00e3o do aplicativo n\\U00e3o encontrada.\";\n}"))
  
                }
            }
        }
        
    }
}

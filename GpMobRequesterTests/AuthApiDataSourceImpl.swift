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
        
        var login               = "24006664"
        var idAutorizacao       = 83
        let authApiDataSource   = AuthApiDataSourceImpl.getInstance()
        var authRequest         = AuthRequest(login: login, idAutorizacao: idAutorizacao)
        var authResponseResult: AuthResponse?
        
        describe("Authorizing an user") {
            
            context("When authorize with success") {
                it("Should return a valid authResponse") {
                    authApiDataSource.authorize(authRequest: authRequest)
                        .onSuccess() { response in
                            authResponseResult = response
                        }
                        .onFailed() { e in }
                        .call()
                    
                    expect(authResponseResult?.getCodigo()).toEventually(equal(2))
                    
                    expect(authResponseResult?.getMensagem()).toEventually(equal("Autorização do aplicativo não encontrada."))
                }
            }
        
            context("When authorize failed") {
                beforeEach {
                    login    = "non-existent"
                    idAutorizacao = 1111
                    
                    authRequest = AuthRequest(login: login, idAutorizacao: idAutorizacao)
                }
                
                it("Should return an not authorized error") {
                    authApiDataSource.authorize(authRequest: authRequest)
                        .onSuccess() { response in
                            authResponseResult = response
                        }
                        .onFailed() { e in }
                        .call()
                    
                    expect(authResponseResult?.getCodigo()).toEventually(equal(404))
                    expect(authResponseResult?.getMensagem()).toEventually(equal("{Login não encontrado."))
                }
            }
        }
        
    }
}

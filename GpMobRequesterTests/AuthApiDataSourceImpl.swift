//
//  AuthApiDataSourceImpl.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
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
        
        describe("Authorizing an user") {
            
            var login             = "24006664"
            var nomeDispositivo   = "24006664-2"
            let userApiDataSource = AuthApiDataSourceImpl.getInstance()
            var authRequest       = AuthRequest(login: login, nomeDispositivo: nomeDispositivo)
            
            context("When authorize success") {
                var authResponseResult: AuthResponse?
                
                it("Should return a valid authResponse") {
                    userApiDataSource.authorize(authRequest: authRequest)
                        .onSuccess() { response in
                            authResponseResult = response
                        }
                        .onFailed() { e in
                        }
                        .call()
                    
                    expect(authResponseResult?.getIdAutorizacao()).toEventually(equal(83))
                    
                    expect(authResponseResult?.getUrlAutorizacao()).toNotEventually(equal("http://hackathonhabilitacao.sefaz.al.gov.br"))
                }
            }
            
            context("When authorize failed"){
                
                beforeEach {
                    login    = "non-existent"
                    nomeDispositivo = "none"
                    
                    authRequest = AuthRequest(login: login, nomeDispositivo: nomeDispositivo)
                }
                
                it("Should return an not authorized error") {
                    var errorResponse: ErrorResponse?
                    
                    userApiDataSource.authorize(authRequest: authRequest)
                        .onFailed() { error in
                            errorResponse = error as? ErrorResponse
                        }
                        .call()
                    expect(errorResponse?.statusCode).toEventually(equal(404))
                    expect(errorResponse?.detailMessage).toEventually(equal("{\n    codigo = 404;\n    mensagem = \"Login n\\U00e3o encontrado.\";\n}"))
                }
            }
        }
    }
}
   

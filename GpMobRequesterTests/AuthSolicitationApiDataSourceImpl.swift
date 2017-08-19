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
 Unit tests for the implementation of {@link AuthSolicitationApiDataSourceImpl}
 */
class AuthSolicitationApiDataSourceImplTest: QuickSpec {
    
    override func spec() {
        
        describe("Requesting user authorization") {
            
            var login             = "24006664"
            var nomeDispositivo   = "24006664-2"
            let userApiDataSource = AuthSolicitationApiDataSourceImpl.getInstance()
            var authRequest       = AuthSolicitationRequest(login: login, nomeDispositivo: nomeDispositivo)
            
            context("When request authorization success") {
                var authResponseResult: AuthSolicitationResponse?
                
                it("Should return a valid authResponse") {
                    userApiDataSource.requestAuthorization(authRequest: authRequest)
                        .onSuccess() { response in
                            authResponseResult = response
                        }
                        .call()
                    
                    expect(authResponseResult?.getIdAutorizacao()).toEventually(equal(136))
                    
                    expect(authResponseResult?.getUrlAutorizacao()).toNotEventually(equal("http://hackathonhabilitacao.sefaz.al.gov.br"))
                }
            }
            
            context("When request authorization failed"){
                
                beforeEach {
                    login    = "non-existent"
                    nomeDispositivo = "none"
                    
                    authRequest = AuthSolicitationRequest(login: login, nomeDispositivo: nomeDispositivo)
                }
                
                it("Should return an not authorized error") {
                    var errorResponse: ErrorResponse?
                    
                    userApiDataSource.requestAuthorization(authRequest: authRequest)
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
   

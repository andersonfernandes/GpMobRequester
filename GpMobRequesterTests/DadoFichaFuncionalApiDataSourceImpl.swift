//
//  DadoFichaFuncionalApiDataSourceImpl.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

import Quick
import Nimble
import Retrofire
@testable import GpMobRequester

/**
 Unit tests for the implementation of {@link DadoFichaFuncionalApiDataSourceImpl}
 */
class DadoFichaFuncionalApiDataSourceImplTest: QuickSpec {

    override func spec() {
        describe("Sending a Dado Ficha Funcional request") {
            let apiDataSource: DadoFichaFuncionalApiDataSourceImpl = DadoFichaFuncionalApiDataSourceImpl.getInstance()
            let descricao = "João"
            let tipoDadoFichaFuncional = 2
            let dadoFichaFuncionalRequest = DadoFichaFuncionalRequest(descricao: descricao, tipoDadoFichaFuncional: tipoDadoFichaFuncional)
            
            context("With authorization") {
                var dadoFichaFuncionalResponse: DadoFichaFuncionalResponse?
                let userToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYXJjZWxvbWFsdGEiLCJhdXRoIjoiUk9MRV9FTUlfRVhUUkFUTyxST0xFX1JFTF9ERU5VTl9FU1BPTlRBTkVBLFJPTEVfRU1JX0NQIiwiaWRDb25leGFvIjoiMjEzQ0I5QzNDNkU0OTkxMUU1MDM3MTk0RUQxOUQxNzMiLCJudW1QZXNzb2EiOjUyOTQ4MywiaW5kU3RhdHVzIjoiQSIsImlkQXBsaWNhdGl2byI6NiwiaWRBdXRvcml6YWNhbyI6MzcsImV4cCI6MTUxODgyNTYwMH0.qxmpBK7VNRQNXg97z0qNCTUPIXVf8SzUGsOuFHBC7cs15vzwFfS7AdEKxVIBk2AZirlF1gYW_Phv06bM8YYcVA"
                
                apiDataSource.insert(userToken: userToken, dadoFichaFuncionalRequest: dadoFichaFuncionalRequest)
                    .onSuccess() { response in
                        dadoFichaFuncionalResponse = response
                    }
                    .call()
                
                it("response nameFuncionario should be set") {
                    expect(dadoFichaFuncionalResponse?.getId()).toEventually(equal(37923))
                }
                
                it("response dependentes should be filled") {
                    expect(dadoFichaFuncionalResponse?.getTipoStatus()).toEventually(equal("AGUARDANDO_APROVACAO"))
                }
                
            }
            
            context("Without authorization") {
                var errorResponse: ErrorResponse?
                
                apiDataSource.insert(userToken: nil, dadoFichaFuncionalRequest: dadoFichaFuncionalRequest)
                    .onFailed() { error in
                        errorResponse = error as? ErrorResponse
                    }
                    .call()
                
                it("response should have 403 status") {
                    expect(errorResponse?.statusCode).toEventually(equal(403))
                }
                
            }
        }
        
        escribe("Sending a Dado Ficha Funcional Anexo request") {
            let apiDataSource: DadoFichaFuncionalApiDataSourceImpl = DadoFichaFuncionalApiDataSourceImpl.getInstance()
            let id = 12
            let anexo = "MiJ9.eyJzdWIiOiJtYXJjZWxvbWFsdGEiLCJhdXRoIjoiUk9MRV9FTUlfRVhUUkFUTyxST0xFX1JFTF9ERU5VTl9FU1BPTlRBTkVBLFJPTEVfRU1JX0NQIiwiaWRDb25leGFvIjoiMjEzQ0I5QzNDNkU0OTkxMUU1MDM3MTk0RUQxOUQxNzMiLCJudW1QZXNzb2EiOjUyOTQ4MywiaW5kU3RhdHVzIjoiQSIsImlkQXBsaWNhdGl2byI6NiwiaWRBdXRvcml6YWNhbyI6Mz"
            let dadoFichaFuncionalAnexoRequest = DadoFichaFuncionalAnexoRequest(id: id, anexo: anexo)
            
            context("With authorization") {
                var dadoFichaFuncionalAnexoResponse: DadoFichaFuncionalAnexoResponse?
                let userToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYXJjZWxvbWFsdGEiLCJhdXRoIjoiUk9MRV9FTUlfRVhUUkFUTyxST0xFX1JFTF9ERU5VTl9FU1BPTlRBTkVBLFJPTEVfRU1JX0NQIiwiaWRDb25leGFvIjoiMjEzQ0I5QzNDNkU0OTkxMUU1MDM3MTk0RUQxOUQxNzMiLCJudW1QZXNzb2EiOjUyOTQ4MywiaW5kU3RhdHVzIjoiQSIsImlkQXBsaWNhdGl2byI6NiwiaWRBdXRvcml6YWNhbyI6MzcsImV4cCI6MTUxODgyNTYwMH0.qxmpBK7VNRQNXg97z0qNCTUPIXVf8SzUGsOuFHBC7cs15vzwFfS7AdEKxVIBk2AZirlF1gYW_Phv06bM8YYcVA"
                
                apiDataSource.insertAttachment(userToken: userToken, dadoFichaFuncionalAnexoRequest: dadoFichaFuncionalAnexoRequest)
                    .onSuccess() { response in
                        dadoFichaFuncionalAnexoResponse = response
                    }
                    .call()
                
                it("") {
                    
                }
                
            }
            
            context("Without authorization") {
                var errorResponse: ErrorResponse?
                
                apiDataSource.insertAttachment(userToken: nil, dadoFichaFuncionalAnexoRequest: dadoFichaFuncionalAnexoRequest)
                    .onFailed() { error in
                        errorResponse = error as? ErrorResponse
                    }
                    .call()
                
                it("response should have 403 status") {
                    expect(errorResponse?.statusCode).toEventually(equal(403))
                }
                
            }
        }
    }
    
}

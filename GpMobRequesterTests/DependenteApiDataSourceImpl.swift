//
//  DependenteApiDataSourceImpl.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 20/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

import Quick
import Nimble
import Retrofire
@testable import GpMobRequester

/**
 Unit tests for the implementation of {@link DependenteApiDataSourceImpl}
 */
class DependenteApiDataSourceImplTest: QuickSpec {

    override func spec() {
        describe("Sending a DependenteRequest") {
            let apiDataSource: DependenteApiDataSourceImpl = DependenteApiDataSourceImpl.getInstance()
            
            let cpf = "84794918097"
            let nome = "John Doe"
            let rg = "1212120"
            let codigoTipoSexo = "M"
            let tipoParentesco = 2
            let dataNascimento = "2017-08-17T13:18:49.457Z"
            
            let dependenteRequest = DependenteRequest(cpf: cpf, nome: nome, rg: rg, tipoParentesco: tipoParentesco, codigoTipoSexo: codigoTipoSexo, dataNascimento: dataNascimento)
            
            context("With authorization") {
                var dependenteResponse: DependenteResponse?
                let userToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYXJjZWxvbWFsdGEiLCJhdXRoIjoiUk9MRV9FTUlfRVhUUkFUTyxST0xFX1JFTF9ERU5VTl9FU1BPTlRBTkVBLFJPTEVfRU1JX0NQIiwiaWRDb25leGFvIjoiMjEzQ0I5QzNDNkU0OTkxMUU1MDM3MTk0RUQxOUQxNzMiLCJudW1QZXNzb2EiOjUyOTQ4MywiaW5kU3RhdHVzIjoiQSIsImlkQXBsaWNhdGl2byI6NiwiaWRBdXRvcml6YWNhbyI6MzcsImV4cCI6MTUxODgyNTYwMH0.qxmpBK7VNRQNXg97z0qNCTUPIXVf8SzUGsOuFHBC7cs15vzwFfS7AdEKxVIBk2AZirlF1gYW_Phv06bM8YYcVA"
                
                apiDataSource.insert(userToken: userToken, dependenteRequest: dependenteRequest)
                    .onSuccess() { response in
                        dependenteResponse = response
                    }
                    .call()
                
                it("response nameFuncionario should be set") {
                    expect(dependenteResponse?.getId()).toEventually(equal(37923))
                }
                
                it("response dependentes should be filled") {
                    expect(dependenteResponse?.getTipoStatus()).toEventually(equal("AGUARDANDO_APROVACAO"))
                }
                
            }
            
            context("Without authorization") {
                var errorResponse: ErrorResponse?
                
                apiDataSource.insert(userToken: nil, dependenteRequest: dependenteRequest)
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

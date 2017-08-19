//
//  FichaFuncionalApiDataSourceImpl.swift
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
 Unit tests for the implementation of {@link FichaFuncionalApiDataSourceImpl}
 */
class FichaFuncionalApiDataSourceImplTest: QuickSpec {
    
    override func spec() {
        
        describe("GET Ficha Funcional") {
            let apiDataSource: FichaFuncionalApiDataSourceImpl = FichaFuncionalApiDataSourceImpl.getInstance()
            
            context("With authorization") {
                var fichaFuncionalResponse: FichaFuncional?
                let userToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYXJjZWxvbWFsdGEiLCJhdXRoIjoiUk9MRV9FTUlfRVhUUkFUTyxST0xFX1JFTF9ERU5VTl9FU1BPTlRBTkVBLFJPTEVfRU1JX0NQIiwiaWRDb25leGFvIjoiMjEzQ0I5QzNDNkU0OTkxMUU1MDM3MTk0RUQxOUQxNzMiLCJudW1QZXNzb2EiOjUyOTQ4MywiaW5kU3RhdHVzIjoiQSIsImlkQXBsaWNhdGl2byI6NiwiaWRBdXRvcml6YWNhbyI6MzcsImV4cCI6MTUxODgyNTYwMH0.qxmpBK7VNRQNXg97z0qNCTUPIXVf8SzUGsOuFHBC7cs15vzwFfS7AdEKxVIBk2AZirlF1gYW_Phv06bM8YYcVA"
                
                apiDataSource.get(userToken: userToken)
                    .onSuccess() { response in
                        fichaFuncionalResponse = response
                    }
                    .call()
                
                it("response nameFuncionario should be set") {
                    expect(fichaFuncionalResponse?.getNomeFuncionario()).toEventually(equal("MARCELO TENÓRIO MALTA"))
                }
                
                it("response dependentes should be filled") {
                    expect(fichaFuncionalResponse?.getDependentes()?.count).toEventually(equal(5))
                }
                
                it("response grupos should be filled") {
                    expect(fichaFuncionalResponse?.getGrupos()?.count).toEventually(equal(4))
                }
            }
            
            context("Without authorization") {
                var errorResponse: ErrorResponse?
                
                apiDataSource.get(userToken: nil)
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

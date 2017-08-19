//
//  SessionLocalDataSource.swift
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
 Unit tests for the implementation of {@link AuthApiDataSourceImpl}
 */
class SessionLocalDataSourceTests: QuickSpec {
    
    override func spec() {
        describe("Save user token") {
            let sessionLocalDataSource = SessionLocalDataSource.getInstance(defaultsDao: UserDefaults.standard)
            let userToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyNDAwNjY2NCIsImF1dGgiOiJST0xFX0VNSV9FWFRSQVRPLFJPTEVfUkVMX0RFTlVOX0VTUE9OVEFORUEsUk9MRV9FTUlfQ1AsUk9MRV9SRUxfT01JU1NBTyIsImlkQ29uZXhhbyI6IjBDODIyN0M4QzJFNzlGMTJGMkIzMkU2QURENDEzREI1IiwibnVtUGVzc29hIjoyNjQ4LCJpbmRTdGF0dXMiOiJBIiwiaWRBcGxpY2F0aXZvIjozMCwiaWRBdXRvcml6YWNhbyI6MTM0LCJleHAiOjE1MTg5OTg0MDB9.4RurHdYiCdJuYrvxA-ZEKEAsEPWwi5GDN-Gh05BTwfo-4vYEHmBGNEoo2uacqXHf1Aj08r2Zdz5hHDQAw3rlcw"
            
            context("Save with a valid token") {
                let saveUserTokenResult = sessionLocalDataSource.saveUsetToken(userToken: userToken)
                
                it("Should return the token") {
                    expect(saveUserTokenResult).to(equal(userToken))
                }
            }
            
            context("Save with an invalid token") {
                let saveUserTokenResult = sessionLocalDataSource.saveUsetToken(userToken: "")
                
                it("Should return nil") {
                    expect(saveUserTokenResult).to(beNil())
                }
            }
        }
    }
    
}

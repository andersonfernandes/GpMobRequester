//
//  AuthorizationPresenter.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

class AuthorizationPresenter: AuthorizationPresenterContract {
    
    let view: AuthorizationViewContract
    let authApiDataSource: AuthSolicitationApiDataSource
    let sessionLocalDataSource: SessionLocalDataSource
    
    init(view: AuthorizationViewContract,
         authApiDataSource: AuthSolicitationApiDataSource,
         sessionLocalDataSource: SessionLocalDataSource
        ) {
        self.view                   = view
        self.authApiDataSource      = authApiDataSource
        self.sessionLocalDataSource = sessionLocalDataSource 
    }
    
    func hasUserToken() -> Bool {
        let userToken = sessionLocalDataSource.getUserToken()
        return userToken != nil && userToken != ""
    }
    
    func hasIdAuthorizationPending() -> Bool {
        let id = sessionLocalDataSource.getIdAuthorizationPending()
        return  id != nil && id != 0
    }
    
    func requestAuthorization(matricula: String) {
        let authRequest = AuthSolicitationRequest(login: matricula, nomeDispositivo: "\(matricula)-\(Date())")
        authApiDataSource.requestAuthorization(authRequest: authRequest)
            .onSuccess { authResponse in
                self.sessionLocalDataSource.saveIdAuthorizationPending(authResponse?.getIdAutorizacao())
                self.sessionLocalDataSource.saveMatricula(matricula)
                self.view.goToAuthorizationConfirmation()
            }
            .onFailed { _ in
                self.view.showError(message: "Verifique se sua matrícula está correta")
            }
            .call()
    }
    
}

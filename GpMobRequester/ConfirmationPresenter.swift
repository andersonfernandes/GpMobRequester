//
//  ConfirmationPresenter.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

class ConfirmationPresenter: ConfirmationPresenterContract {
    
    let view: ConfirmationViewContract
    let authApiDataSource: AuthApiDataSource
    let sessionLocalDataSource: SessionLocalDataSource
    
    init(view: ConfirmationViewContract,
         authApiDataSource: AuthApiDataSource,
         sessionLocalDataSource: SessionLocalDataSource
        ) {
        self.view                   = view
        self.authApiDataSource      = authApiDataSource
        self.sessionLocalDataSource = sessionLocalDataSource
    }
    
    func confirmAuthorization() {
        let matricula = sessionLocalDataSource.getMatricula()
        let idAutorizacao = sessionLocalDataSource.getIdAuthorizationPending()
        
        let authRequest = AuthRequest(login: matricula!, idAutorizacao: idAutorizacao!)
        authApiDataSource.authorize(authRequest: authRequest)
            .onSuccess { authResponse in
                self.sessionLocalDataSource.destroyIdAuthorizationPending()
                
                self.sessionLocalDataSource.saveUserToken(userToken: authResponse?.getIdToken())
                
                self.view.goToMainTabBar()
            }
            .onFailed { _ in
                self.view.showError(message: "Verifique se você autorizou o nosso App na SEFAZ")
            }
            .call()
    }
    
}

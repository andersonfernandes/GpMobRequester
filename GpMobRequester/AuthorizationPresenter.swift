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
    
    init(view: AuthorizationViewContract) {
        self.view = view
    }
    
    func requestAuthorization(matricula: String) {
        view.goToAuthorizationConfirmation()
    }
    
}

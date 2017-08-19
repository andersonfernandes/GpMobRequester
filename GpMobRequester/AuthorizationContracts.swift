//
//  AuthorizationContracts.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

protocol AuthorizationViewContract {
    func goToAuthorizationConfirmation() -> Void
    func showError(message: String) -> Void
}

protocol AuthorizationPresenterContract {
    func requestAuthorization(matricula: String) -> Void
}

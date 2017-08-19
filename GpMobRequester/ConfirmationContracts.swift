//
//  ConfirmationContracts.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

protocol ConfirmationViewContract {
    func goToMainTabBar() -> Void
    func showError(message: String) -> Void
}

protocol ConfirmationPresenterContract {
    func confirmAuthorization() -> Void
}

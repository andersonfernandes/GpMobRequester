//
//  MainTabBarContracts.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

protocol MainTabBarViewContract {
    func configureHeaderOn(_ viewController: UIViewController) -> Void
    func goToLogin() -> Void
}

protocol MainTabBarPresenterContract {
    func logout()
}

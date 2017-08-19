//
//  MainTabPresenter.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

class MainTabPresenter: MainTabBarPresenterContract {
    let view: MainTabBarViewContract
    let sessionLocalDataSource: SessionLocalDataSource
    
    init(view: MainTabBarViewContract,
         sessionLocalDataSource: SessionLocalDataSource
        ) {
        self.view                   = view
        self.sessionLocalDataSource = sessionLocalDataSource
    }
    
    func logout() {
        sessionLocalDataSource.destroy()
        
        view.goToLogin()
    }
}

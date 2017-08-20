//
//  DependentsTabItemPresenter.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 20/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

class DependentsTabItemPresenter: DependentsTabItemPresenterContract {
    
    let view: DependentsTabItemViewContract
    let apiDataSource: FichaFuncionalApiDataSource
    let sessionLocalDataSource: SessionLocalDataSource
    
    init(view: DependentsTabItemViewContract,
         apiDataSource: FichaFuncionalApiDataSource,
         sessionLocalDataSource: SessionLocalDataSource
        ) {
        self.view                   = view
        self.apiDataSource          = apiDataSource
        self.sessionLocalDataSource = sessionLocalDataSource
    }
    
    func getDependents() {
        let userToken = sessionLocalDataSource.getUserToken()
        
        apiDataSource.get(userToken: userToken!)
            .onSuccess { fichaFuncional in
                guard let dependents = fichaFuncional?.getDependentes() else { return }
                
                self.view.loadDependentes(list: dependents)
            }
            .onFailed { _ in
            }
            .call()
    }
 
}

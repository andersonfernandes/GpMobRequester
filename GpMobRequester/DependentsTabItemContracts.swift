//
//  DependentsTabItemContracts.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 20/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

protocol DependentsTabItemViewContract {
    func loadDependentes(list: [Dependente])
}

protocol DependentsTabItemPresenterContract {
    func getDependents()
}

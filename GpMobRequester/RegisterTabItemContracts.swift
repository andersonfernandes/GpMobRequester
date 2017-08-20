//
//  RegisterTabItemContracts.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

protocol RegisterTabItemViewContract {
    func loadDadosCadastrais(list: [DadoFichaDto])
}

protocol RegisterTabItemPresenterContract {
    func getDadadosCadastrais()
    func saveSolicitacao(_ tipoDadoFuncional: Int?)
    func hasSolicitacao(_ tipoDadoFuncional: Int?) -> Bool
}

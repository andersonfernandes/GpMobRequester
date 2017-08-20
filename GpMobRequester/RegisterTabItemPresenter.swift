//
//  RegisterTabItemPresenter.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

class RegisterTabItemPresenter: RegisterTabItemPresenterContract {
    
    let view: RegisterTabItemViewContract
    let apiDataSource: FichaFuncionalApiDataSource
    let sessionLocalDataSource: SessionLocalDataSource
    
    init(view: RegisterTabItemViewContract,
         apiDataSource: FichaFuncionalApiDataSource,
         sessionLocalDataSource: SessionLocalDataSource
        ) {
        self.view                   = view
        self.apiDataSource          = apiDataSource
        self.sessionLocalDataSource = sessionLocalDataSource
    }
    
    func getDadadosCadastrais() {
        let userToken = sessionLocalDataSource.getUserToken()
        
        apiDataSource.get(userToken: userToken!)
            .onSuccess { fichaFuncional in
                let list = groupByOnCadastro(self, fichaFuncional: fichaFuncional!, list: [DataTypes.NOME.rawValue, DataTypes.ESTADO_CIVIL.rawValue, DataTypes.TELEFONE.rawValue, DataTypes.ENDERECO.rawValue, DataTypes.GRAU_DE_INSTRUCAO.rawValue])
                
                self.view.loadDadosCadastrais(list: list)
            }
            .onFailed { _ in
            }
            .call()
    }
    
    func saveSolicitacao(_ tipoDadoFuncional: Int?) {
        sessionLocalDataSource.saveSolicitacao(tipoDadoFuncional)
    }
    
    func hasSolicitacao(_ tipoDadoFuncional: Int?) -> Bool {
       let tipo = sessionLocalDataSource.getSolicitacao(tipoDadoFuncional)
        return tipo != nil && tipo != 0
    }
}

//
//  DependenteApiDataSource.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 20/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire

protocol DependenteApiDataSource {
    var authorizePath: String { get }
    
    func insert(userToken: String?, dependenteRequest: DependenteRequest) -> Call<DependenteResponse>
}

extension DependenteApiDataSource {
    var authorizePath: String { return "/fz_ficha_funcional_api/api/public/dependenteFuncionario" }
}

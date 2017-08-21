//
//  FichaFuncionalApiDataSource.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire

protocol FichaFuncionalApiDataSource {
    var authorizePath: String { get }
    
    func get(userToken: String?) -> Call<FichaFuncional>
}

extension FichaFuncionalApiDataSource {
    var authorizePath: String { return "/sfz_ficha_funcional_api/api/public/fichaFuncional" }
}

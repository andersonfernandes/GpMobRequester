//
//  AuthApiDataSource.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire

protocol AuthApiDataSource{
    var authorizePath: String { get }
    
    func authorize(authRequest: AuthRequest) -> Call<AuthResponse>
}

extension AuthApiDataSource {
    var authorizePath: String { return "/sfz-habilitacao-aplicativo-api/api/public/autorizacao-aplicativo/solicitar" }
}

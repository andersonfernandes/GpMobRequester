//
//  AuthApiDataSource.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire

protocol AuthApiDataSource {
    var authorizePath: String { get }
    
    func authorize(authRequest: AuthRequest) -> Call<AuthResponse>
}

extension AuthApiDataSource {
    var authorizePath: String { return "/api/public/autenticar" }
}

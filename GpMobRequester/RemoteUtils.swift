//
//  RemoteUtils.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

class RemoteUtils {
    private static let BASE_URL = "http://hackathonapi.sefaz.al.gov.br"
    static func buildUrl(path: String) -> String {
        return "\(BASE_URL)\(path)"
    }
    
    static func buildHeaders(accessToken: String) -> [String:String] {
        let headers = [
            "Authorization": accessToken
        ]
        
        return headers
    }
}

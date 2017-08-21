//
//  FichaFuncionalApiDataSourceImpl.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import Retrofire

class FichaFuncionalApiDataSourceImpl: RemoteBase, FichaFuncionalApiDataSource {
    private static var INSTANCE: FichaFuncionalApiDataSourceImpl?
    
    static func getInstance() -> FichaFuncionalApiDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = FichaFuncionalApiDataSourceImpl()
        }
        
        return INSTANCE!
    }
    
    func get(userToken: String?) -> Call<FichaFuncional> {
        let path = RemoteUtils.buildUrl(path: authorizePath)
//        let userToken2 = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYXJjZWxvbWFsdGEiLCJhdXRoIjoiUk9MRV9FTUlfRVhUUkFUTyxST0xFX1JFTF9ERU5VTl9FU1BPTlRBTkVBLFJPTEVfRU1JX0NQIiwiaWRDb25leGFvIjoiMjEzQ0I5QzNDNkU0OTkxMUU1MDM3MTk0RUQxOUQxNzMiLCJudW1QZXNzb2EiOjUyOTQ4MywiaW5kU3RhdHVzIjoiQSIsImlkQXBsaWNhdGl2byI6NiwiaWRBdXRvcml6YWNhbyI6MzcsImV4cCI6MTUxODgyNTYwMH0.qxmpBK7VNRQNXg97z0qNCTUPIXVf8SzUGsOuFHBC7cs15vzwFfS7AdEKxVIBk2AZirlF1gYW_Phv06bM8YYcVA"
        let header = ["Authorization": "Bearer " + (userToken ?? "")]
        
        let request = RequestBuilder(path: path)
            .headers(header)
            .build()
        
        return self.callSingle(request: request)
    }
    
}

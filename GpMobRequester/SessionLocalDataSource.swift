//
//  SessionLocalDataSource.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import SwiftyJSON

public class SessionLocalDataSource {
    private static var INSTANCE: SessionLocalDataSource?
    
    private let defaultsDao: UserDefaults
    
    private init(defaultsDao: UserDefaults) {
        self.defaultsDao = defaultsDao
    }
    
    public static func getInstance(defaultsDao: UserDefaults) -> SessionLocalDataSource {
        if (INSTANCE == nil) {
            INSTANCE = SessionLocalDataSource(defaultsDao: defaultsDao)
        }
        
        return INSTANCE!
    }
    
    public func saveUsetToken(userToken: String?) -> String? {
        if (userToken == nil || (userToken?.isEmpty)!){
            return nil
        }
        
        defaultsDao.set(userToken, forKey: FichaFuncional.USER_TOKEN_PREFERENCE)
        
        return userToken
    }
    
    public func destroy() {
        defaultsDao.set(nil, forKey: FichaFuncional.USER_TOKEN_PREFERENCE)
    }
    
    public func getUserToken() -> String {
        let userToken: [String: String] = defaultsDao.dictionary(forKey: FichaFuncional.USER_TOKEN_PREFERENCE) as! [String : String]
        
        return userToken[FichaFuncional.USER_TOKEN_PREFERENCE]!
    }
    
}

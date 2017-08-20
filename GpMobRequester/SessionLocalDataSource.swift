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
    private static let ID_AUTHORIZATION_PENDING = "ID_AUTHORIZATION_PENDING "
    private static let MATRICULA = "MATRICULA "
    private static let SOLICITACAO = "SOLICITACAO_"
    
    private init(defaultsDao: UserDefaults) {
        self.defaultsDao = defaultsDao
    }
    
    public static func getInstance(defaultsDao: UserDefaults) -> SessionLocalDataSource {
        if (INSTANCE == nil) {
            INSTANCE = SessionLocalDataSource(defaultsDao: defaultsDao)
        }
        
        return INSTANCE!
    }
    
    func saveSolicitacao(_ tipoDadoFuncional: Int?) {
        if tipoDadoFuncional == nil || tipoDadoFuncional == 0 {
            return
        }
        let key = "\(SessionLocalDataSource.SOLICITACAO)\(tipoDadoFuncional!)"
        
        defaultsDao.set(tipoDadoFuncional, forKey: key)
    }
    
    func saveIdAuthorizationPending(_ id: Int?) {
        if id == nil || id == 0 {
            return
        }
        
        defaultsDao.set(id, forKey: SessionLocalDataSource.ID_AUTHORIZATION_PENDING)
    }
    
    func saveMatricula(_ matricula: String?) {
        if matricula == nil || matricula == "" {
            return
        }
        
        defaultsDao.set(matricula, forKey: SessionLocalDataSource.MATRICULA)
    }
    
    
    public func saveUserToken(userToken: String?) -> String? {
        if (userToken == nil || (userToken?.isEmpty)!){
            return nil
        }
        
        defaultsDao.set(userToken, forKey: FichaFuncional.USER_TOKEN_PREFERENCE)
        
        return userToken
    }
    
    public func destroy() {
        defaultsDao.set(nil, forKey: FichaFuncional.USER_TOKEN_PREFERENCE)
    }
    
    public func destroyIdAuthorizationPending() {
        defaultsDao.set(nil, forKey: SessionLocalDataSource.ID_AUTHORIZATION_PENDING)
    }
    
    public func getUserToken() -> String? {
        return defaultsDao.string(forKey: FichaFuncional.USER_TOKEN_PREFERENCE)
    }
    
    public func getIdAuthorizationPending() -> Int? {
        return defaultsDao.integer(forKey: SessionLocalDataSource.ID_AUTHORIZATION_PENDING)
    }
    
    public func getMatricula() -> String? {
        return defaultsDao.string(forKey: SessionLocalDataSource.MATRICULA)
    }
    
    public func getSolicitacao(_ tipoDadoFuncional: Int?) -> Int? {
        let key = "\(SessionLocalDataSource.SOLICITACAO)\(tipoDadoFuncional!)"
        
        return defaultsDao.integer(forKey: key)
    }
    
    
}

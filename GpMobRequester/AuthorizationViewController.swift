//
//  AuthorizationViewController.swift
//  GpMobRequester
//
//  Created by roga on 8/18/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

class AuthorizationViewController: UIViewController {
    @IBOutlet weak var someOut: UIView!
    @IBOutlet weak var loginContainer: UIView!
    @IBOutlet weak var loginContainerClippingMask: UIView!
    @IBOutlet weak var loginContainerShadow: UIView!
    
    @IBOutlet weak var matriculaInput: UITextField!
    
    lazy var presenter: AuthorizationPresenterContract = {
        let authApi = AuthSolicitationApiDataSourceImpl.getInstance()
        let sessionLocalDataSource = SessionLocalDataSource.getInstance(defaultsDao: UserDefaults.standard)
        return AuthorizationPresenter(view: self, authApiDataSource: authApi, sessionLocalDataSource: sessionLocalDataSource)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        UIApplication.shared.statusBarStyle = .lightContent
        
        setTheme()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if presenter.hasUserToken() {
            goToMainTabBar()
            return
        }
        
        if presenter.hasIdAuthorizationPending() {
            goToAuthorizationConfirmation()
            return
        }
    }
    
    func setTheme() {
    
        self.view.backgroundColor = Theme.backgroundColor
        
        loginContainer.layer.cornerRadius = 10
        loginContainer.clipsToBounds      = true
        
        loginContainerShadow.clipsToBounds = false
        loginContainerShadow.layer.shadowColor = UIColor.black.cgColor
        loginContainerShadow.layer.shadowOpacity = 0.1
        loginContainerShadow.layer.shadowOffset = CGSize(width: 1, height: 4)
        loginContainerShadow.layer.shadowRadius = 8
        
        loginContainerClippingMask.clipsToBounds = true
        loginContainerClippingMask.layer.shadowRadius = 10
    }
    
    @IBAction func requestLogin(_ sender: Any) {
        let matricula: String = matriculaInput.text!
        presenter.requestAuthorization(matricula: matricula)
    
    }
    
    
}

extension AuthorizationViewController: AuthorizationViewContract {
    
    func goToMainTabBar() {
        let rootController = Bundle.main.loadNibNamed("MainTabBarViewController", owner: self, options: nil)?[0] as? MainTabBarViewController
        self.present(rootController!, animated: true)
    }
    
    func goToAuthorizationConfirmation() {
        let rootController = Bundle.main.loadNibNamed("ConfimationAuthenticateView", owner: ConfimationAuthenticateView.self, options: nil)?[0] as? ConfimationAuthenticateView
        
        self.present(rootController!, animated: true)
        
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}


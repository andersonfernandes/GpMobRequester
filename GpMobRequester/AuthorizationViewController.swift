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
    
    lazy var presenter: AuthorizationPresenterContract = {
        return AuthorizationPresenter(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()
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
        let matricula = "192831"
        presenter.requestAuthorization(matricula: matricula)
    
    }
    
    
}

extension AuthorizationViewController: AuthorizationViewContract {
    
    func goToAuthorizationConfirmation() {
        let rootController = Bundle.main.loadNibNamed("ConfimationAuthenticateView", owner: self, options: nil)?[0] as? ConfimationAuthenticateView
        
        
        self.present(rootController!, animated: true)
        
    }
    
    func showError(message: String) {
        
    }
}


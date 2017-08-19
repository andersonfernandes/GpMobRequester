//
//  ConfimationAuthenticateView.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

class ConfimationAuthenticateView: UIViewController {
    @IBOutlet weak var autorizedButton: UIButton!
    @IBOutlet weak var goToWebPage: UIButton!
    
    lazy var presenter: ConfirmationPresenterContract = {
        let authApi = AuthApiDataSourceImpl.getInstance()
        let sessionLocalDataSource = SessionLocalDataSource.getInstance(defaultsDao: UserDefaults.standard)
        return ConfirmationPresenter(view: self, authApiDataSource: authApi, sessionLocalDataSource: sessionLocalDataSource)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        autorizedButton.layer.borderColor  = Theme.primaryColor.cgColor
        autorizedButton.layer.borderWidth  = 1
        autorizedButton.layer.cornerRadius = autorizedButton.frame.height / 2
        
        goToWebPage.layer.borderColor      = Theme.primaryColor.cgColor
        goToWebPage.layer.borderWidth      = 1
        goToWebPage.layer.cornerRadius     = goToWebPage.frame.height / 2
        
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

    @IBAction func whenAutorized(_ sender: Any) {
        presenter.confirmAuthorization()
    }
}

extension ConfimationAuthenticateView: ConfirmationViewContract {
    
    func goToMainTabBar() {
        let rootController = Bundle.main.loadNibNamed("MainTabBarViewController", owner: self, options: nil)?[0] as? MainTabBarViewController
        self.present(rootController!, animated: true)
    }
    
    func showError(message: String) {
        
    }
}

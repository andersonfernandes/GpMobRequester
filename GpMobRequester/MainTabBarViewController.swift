//
//  RequestListTabViewController.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarViewController: UITabBarController {
    
    var viewControllerToConfig: UIViewController?
    
    lazy var mainTabBarPresenter: MainTabBarPresenterContract = {
        let sessionLocalDataSource = SessionLocalDataSource.getInstance(defaultsDao: UserDefaults.standard)
        return MainTabPresenter(view: self, sessionLocalDataSource: sessionLocalDataSource)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Theme.backgroundColor
        
    }
    
    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBar.tintColor = Theme.primaryColor
        
        let registerTab = UITabBarItem(title: "Cadastro", image: #imageLiteral(resourceName: "briefcase"), selectedImage: #imageLiteral(resourceName: "briefcase"))
        let dependentsTab = UITabBarItem(title: "Dependentes", image: #imageLiteral(resourceName: "dependent"), selectedImage: #imageLiteral(resourceName: "dependent"))
        let requestTab = UITabBarItem(title: "Solicitações", image: #imageLiteral(resourceName: "file"), selectedImage: #imageLiteral(resourceName: "file"))
        
        //register tab
        let registerTabItemViewController: RegisterTabItemViewController = loadNibNamed("RegisterTabItemViewController", owner: self)!
        registerTabItemViewController.mainTabVarView = self
        let registerNc = UINavigationController(rootViewController: registerTabItemViewController)
        
        //dependents tab
        let dependentsTabItemViewController: DependentsTabItemViewController = loadNibNamed("DependentsTabItemViewController", owner: self)!
        dependentsTabItemViewController.mainTabVarView = self
        let dependentNc = UINavigationController(rootViewController: dependentsTabItemViewController)
        
        //request tab
        let requestTabItemViewController: RequestViewController = loadNibNamed("RequestViewController", owner: self)!
        requestTabItemViewController.mainTabVarView = self
        let requestNc = UINavigationController(rootViewController: requestTabItemViewController)
        
        registerTabItemViewController.tabBarItem   = registerTab
        dependentsTabItemViewController.tabBarItem = dependentsTab
        requestTabItemViewController.tabBarItem    = requestTab
        
        configureNavigationBar(navigationController: registerNc, title: "GP MOB")
        configureNavigationBar(navigationController: requestNc, title: "GP MOB")
        configureNavigationBar(navigationController: dependentNc, title: "GP MOB")
        
        self.viewControllers = [registerNc, dependentNc, requestNc]
        
    }
    
    func configureNavigationBar(navigationController: UINavigationController, title: String) {
        navigationController.navigationBar.barStyle = UIBarStyle.blackTranslucent
        navigationController.navigationBar.barTintColor = UIColor.white
        navigationController.navigationBar.layer.masksToBounds = false
        navigationController.navigationBar.layer.borderWidth   = 0
        navigationController.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        navigationController.navigationBar.layer.shadowOpacity = 0.4
        navigationController.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        navigationController.navigationBar.layer.shadowRadius = 6
        
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black, NSFontAttributeName:UIFont(name:"Asap-Medium", size: 18)!]
        navigationController.navigationBar.topItem?.title = "GP MOB"
        
        UIApplication.shared.statusBarStyle = .lightContent
        UIApplication.shared.statusBarView?.backgroundColor = Theme.primaryColor

    }
    
    
    func addLogout() {
        let logout = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(logoutTapped))
        logout.image = UIImage(named: "logout")
        logout.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.viewControllerToConfig?.navigationItem.leftBarButtonItems = [logout]
    }
    
    func logoutTapped(){
        mainTabBarPresenter.logout()
    }
    
    func addChat() {
        let chatBell = UIBarButtonItem(title: "Chat", style: .plain, target: self, action: #selector(chatTapped))
        chatBell.image = UIImage(named: "bell")
        chatBell.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        viewControllerToConfig!.navigationItem.rightBarButtonItems = [chatBell]
    }
    
    func chatTapped() {
        let chatView: ChatViewController = loadNibNamed("ChatViewController", owner: self)!
        viewControllerToConfig?.navigationController?.pushViewController(chatView, animated: true)
    }
    
}

extension MainTabBarViewController: MainTabBarViewContract {
    
    func configureHeaderOn(_ viewController: UIViewController) {
        self.viewControllerToConfig = viewController
        addLogout()
        addChat()
    }
    
    func goToLogin() {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}


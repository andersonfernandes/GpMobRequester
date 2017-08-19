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
        let registerNc = UINavigationController(rootViewController: registerTabItemViewController)
        
        //dependents tab
        let dependentsTabItemViewController: DependentsTabItemViewController = loadNibNamed("DependentsTabItemViewController", owner: self)!
        let dependentNc = UINavigationController(rootViewController: dependentsTabItemViewController)
        
        
        //request tab
        let requestTabItemViewController: RequestViewController = loadNibNamed("RequestViewController", owner: self)!
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
        navigationController.navigationBar.layer.shadowOpacity = 0.3
        navigationController.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        navigationController.navigationBar.layer.shadowRadius = 6
        
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black, NSFontAttributeName:UIFont(name:"Asap-Medium", size: 18)!]
        navigationController.navigationBar.topItem?.title = "GP MOB"
        
        UIApplication.shared.statusBarStyle = .lightContent
        UIApplication.shared.statusBarView?.backgroundColor = Theme.primaryColor

    }
    
}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}


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
        //change selected and unselect tab bar items color (cadastro)
//        registerTab.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Asap-Medium", size: 10)!, NSForegroundColorAttributeName:UIColor.black], for: UIControlState.normal)
//        registerTab.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Asap-Medium", size: 10)!, NSForegroundColorAttributeName:Theme.primaryColor], for: UIControlState.selected)
        
        
        let dependentsTab = UITabBarItem(title: "Dependentes", image: #imageLiteral(resourceName: "dependent"), selectedImage: #imageLiteral(resourceName: "dependent"))
        
        //change selected and unselect tab bar items color (dependentes)
//        dependentsTab.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Asap-Medium", size: 10)!, NSForegroundColorAttributeName:UIColor.black], for: UIControlState.normal)
//        dependentsTab.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Asap-Medium", size: 10)!, NSForegroundColorAttributeName:Theme.primaryColor], for: UIControlState.selected)
        
        
        let registerTabItemViewController: RegisterTabItemViewController = loadNibNamed("RegisterTabItemViewController", owner: self)!
        let nc = UINavigationController(rootViewController: registerTabItemViewController)
        
        let dependentsTabItemViewController: DependentsTabItemViewController = loadNibNamed("DependentsTabItemViewController", owner: self)!
//        let requestTabItemViewController: RequestViewController = loadNibNamed("RequestViewController", owner: self)!
        
        registerTabItemViewController.tabBarItem   = registerTab
        dependentsTabItemViewController.tabBarItem = dependentsTab
//        requestTabItemViewController.tabBarItem    = dependentsTab
        
        
        self.viewControllers = [nc, dependentsTabItemViewController]
        UIApplication.shared.statusBarStyle = .lightContent
        
        nc.navigationBar.barStyle = UIBarStyle.blackTranslucent
        nc.navigationBar.barTintColor = UIColor.white

        nc.navigationBar.layer.masksToBounds = false
        nc.navigationBar.layer.borderWidth   = 0
        nc.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        nc.navigationBar.layer.shadowOpacity = 0.3
        nc.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        nc.navigationBar.layer.shadowRadius = 6
        
        UIApplication.shared.statusBarView?.backgroundColor = Theme.primaryColor
        nc.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black, NSFontAttributeName:UIFont(name:"Asap-Medium", size: 18)!]
        nc.navigationBar.topItem?.title = "GP MOB"
        
        
    }
    
}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}


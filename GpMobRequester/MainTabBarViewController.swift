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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let registerTab = UITabBarItem(title: "Cadastro", image: UIImage(), selectedImage: UIImage())
        
        let dependentsTab = UITabBarItem(title: "Dependentes", image: UIImage(), selectedImage: UIImage())
        
        let registerTabItemViewController: RegisterTabItemViewController = loadNibNamed("RegisterTabItemViewController", owner: self)!
        
        let dependentsTabItemViewController: DependentsTabItemViewController = loadNibNamed("DependentsTabItemViewController", owner: self)!
        
        registerTabItemViewController.tabBarItem   = registerTab
        dependentsTabItemViewController.tabBarItem = dependentsTab
        
        self.viewControllers = [registerTabItemViewController, dependentsTabItemViewController]
    }
    
}

//
//  RequestViewController.swift
//  GpMobRequester
//
//  Created by Rodrigo Ribeiro on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

class RequestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChat()
        addLogout()
        
        customNavBar()
        customTheme()
        
    }
    
    func addLogout() {
        let logout = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(logoutTapped))
        logout.image = UIImage(named: "logout")
        logout.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        navigationItem.leftBarButtonItems = [logout]
    }
    
    func addChat() {
        let chatBell = UIBarButtonItem(title: "Chat", style: .plain, target: self, action: #selector(chatTapped))
        chatBell.image = UIImage(named: "bell")
        chatBell.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        navigationItem.rightBarButtonItems = [chatBell]
    }
    
    func logoutTapped() {
    }
    
    func chatTapped() {
    }
    
    func customNavBar() {
    }
    
    func customTheme() {
        self.view.backgroundColor = Theme.backgroundColor
    
    }
    


}



//
//  NotificationReminderView.swift
//  GpMobRequester
//
//  Created by Rodrigo Ribeiro on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

class NotificationReminderView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonContainer = UIView(frame: CGRect(x: 0, y: self.view.frame.height * 75 / 100, width: 200, height: 50))
        buttonContainer.center = CGPoint(x: self.view.center.x, y: buttonContainer.frame.origin.y)
        buttonContainer.layer.cornerRadius = buttonContainer.frame.height / 2
        buttonContainer.layer.borderWidth = 1
        buttonContainer.layer.borderColor = Theme.primaryColor.cgColor
        self.view.addSubview(buttonContainer)
        
        let buttonClose     = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        
        buttonClose.titleLabel?.textAlignment = .center
        
        buttonClose.titleLabel?.font = UIFont(name: "Asap-Medium", size: 16)
            buttonClose.setTitle("Continuar", for: .normal)
            buttonClose.setTitleColor(Theme.primaryColor, for: .normal)
        buttonContainer.addSubview(buttonClose)
        
        buttonClose.addTarget(self, action: #selector(self.closeButtonTapped), for: .touchUpInside)
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    func closeButtonTapped() {
        self.dismiss(animated: true)
        
    }
}

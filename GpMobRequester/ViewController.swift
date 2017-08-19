//
//  ViewController.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func nextScreen(_ sender: Any) {
        
        let rootController = Bundle.main.loadNibNamed("AuthorizationViewController", owner: self, options: nil)?[0] as? AuthorizationViewController
        self.present(rootController!, animated: true)

    }
    
    
}

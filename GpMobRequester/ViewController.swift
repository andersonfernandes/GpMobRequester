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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func nextScreen(_ sender: Any) {
        let rootController = Bundle.main.loadNibNamed("AuthorizationViewController", owner: self, options: nil)?[0] as? AuthorizationViewController

        let nav = UINavigationController(rootViewController: rootController!)
        
        self.present(nav, animated: true)
    }
    
    
}

//
//  ConfimationAuthenticateView.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

class ConfimationAuthenticateView: UIView {
    
    @IBOutlet weak var confirmAccess: UIButton!
    @IBOutlet weak var accessWebPageSefaz: UIButton!
    
    override func awakeFromNib() {
      confirmAccess.layer.cornerRadius = accessWebPageSefaz.frame.height / 2
        
      confirmAccess.layer.borderWidth = 1
      confirmAccess.layer.borderColor = UIColor.blue as! CGColor
        
      accessWebPageSefaz.layer.cornerRadius = accessWebPageSefaz.frame.height / 2
        
      accessWebPageSefaz.layer.borderWidth = 1
      accessWebPageSefaz.layer.borderColor = UIColor.blue as! CGColor
    }

}


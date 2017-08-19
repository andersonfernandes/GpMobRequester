//
//  attachmentModalView.swift
//  GpMobRequester
//
//  Created by Rodrigo Ribeiro on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

class attachmentModalView: UIView {
    @IBOutlet weak var mainView: UIView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        Bundle.main.loadNibNamed("attachmentModalView", owner: self, options: nil)
        self.addSubview(mainView);    // adding the top level view to the view hierarchy
    }
    
}

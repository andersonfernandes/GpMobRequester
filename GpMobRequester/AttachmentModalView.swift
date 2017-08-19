//
//  AttachmentModalView.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit
import ImagePicker

class AttachmentModalView: UIView {
    
    var viewController: RegisterTabItemViewController?
    
    @IBAction func attachFile(_ sender: Any) {
//        viewController?.showAttachView()
    }
    
    @IBAction func close(_ sender: Any) {
        self.removeFromSuperview()
    }
}

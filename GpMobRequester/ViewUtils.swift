//
//  ViewUtils.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

func loadNibNamed<T>(_ nibName: String, owner: Any?) -> T? {
    return Bundle.main.loadNibNamed(nibName, owner: owner, options: nil)?[0] as? T
    
}

//
//  requestCell.swift
//  GpMobRequester
//
//  Created by Rodrigo Ribeiro on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

class RequestCell : UITableViewCell {
    @IBOutlet weak var backgroundCell: UIView!

    @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Theme.backgroundColor
        backgroundCell.layer.cornerRadius = 8
    }
}

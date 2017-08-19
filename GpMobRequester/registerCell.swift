//
//  registerTableViewCell.swift
//  GpMobRequester
//
//  Created by Rodrigo Ribeiro on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import UIKit

class registerCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellBackground.layer.cornerRadius = 8
        
        self.backgroundColor = Theme.backgroundColor
    }

}

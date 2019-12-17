//
//  BeverageTableViewCell.swift
//  ThermaeRomae
//
//  Created by 陳姿穎 on 2019/11/19.
//  Copyright © 2019 陳姿穎. All rights reserved.
//

import UIKit

class BeverageTableViewCell: UITableViewCell {

    @IBOutlet var beverage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

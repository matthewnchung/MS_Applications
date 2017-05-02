//
//  TestCell.swift
//  NIH_App
//
//  Created by Matthew Chung on 3/24/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {
    
    @IBOutlet weak var testImage: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

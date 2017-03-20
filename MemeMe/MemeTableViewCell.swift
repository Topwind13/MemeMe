//
//  MemeTableViewCell.swift
//  MemeMe
//
//  Created by TOP on 3/14/2560 BE.
//  Copyright © 2560 TOPP Pongsakorn. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var topText: UILabel!
    @IBOutlet weak var bottomText: UILabel!
    @IBOutlet weak var memeImage: UIImageView!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

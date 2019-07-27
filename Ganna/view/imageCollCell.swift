//
//  imageCollCell.swift
//  Ganna
//
//  Created by Pritesh Khandelwal on 27/07/19.
//  Copyright © 2019 Pritesh Khandelwal. All rights reserved.
//

import UIKit

class imageCollCell: UICollectionViewCell {

    @IBOutlet weak var collImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var identifier: String {
        return "imageCollCell"
    }

}

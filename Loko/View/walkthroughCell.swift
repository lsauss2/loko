//
//  walkthroughCell.swift
//  Loko
//
//  Created by Ludo on 06/11/2017.
//  Copyright © 2017 Ludo. All rights reserved.
//

import UIKit

class walkthroughCell: UICollectionViewCell {
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var title: UILabel!
    
    func configureCell(image: String, title: String){
        self.image.image = UIImage(named: image)
        self.title.text = title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}

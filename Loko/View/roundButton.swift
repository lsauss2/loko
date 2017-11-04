//
//  roundButton.swift
//  Loko
//
//  Created by Ludo on 04/11/2017.
//  Copyright © 2017 Ludo. All rights reserved.
//

import UIKit

class roundButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.height / 2
        self.backgroundColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
    }

}

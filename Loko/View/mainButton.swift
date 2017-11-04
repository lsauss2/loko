//
//  mainButton.swift
//  Loko
//
//  Created by Ludo on 04/11/2017.
//  Copyright © 2017 Ludo. All rights reserved.
//

import UIKit

class mainButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 5
        self.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.2274509804, blue: 0, alpha: 1)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 14.0)
    }

}

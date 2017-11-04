//
//  customTextField.swift
//  Loko
//
//  Created by Ludo on 04/11/2017.
//  Copyright © 2017 Ludo. All rights reserved.
//

import UIKit

class customTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 5
        self.backgroundColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
        self.textColor = UIColor.white
        self.font = UIFont(name: "Montserrat-Regular", size: 12.0)
        
        
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.size.width - 10 - 10, height: bounds.size.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.size.width - 10 - 10, height: bounds.size.height)
    }
    
}

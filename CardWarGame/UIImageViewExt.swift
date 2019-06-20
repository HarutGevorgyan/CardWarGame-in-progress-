//
//  UIImageViewExt.swift
//  CardWarGame
//
//  Created by Harut on 10/05/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import UIKit

extension UIImageView {
    func cardImage() {
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor(red: 75/250, green: 107/250, blue: 47/250, alpha: 1.0).cgColor
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
    }
    
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}



//
//  CustomViews.swift
//  WardrobeME
//
//  Created by Maxim Sukhoparov on 10.08.2021.
//

import UIKit

@IBDesignable

class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}

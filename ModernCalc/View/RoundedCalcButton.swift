//
//  RoundedCalcButton.swift
//  ModernCalc
//
//  Created by Adrian Galecki on 7/7/20.
//  Copyright © 2020 Adrian Galecki. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCalcButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func prepareForInterfaceBuilder() {
        ButtonSetup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ButtonSetup()
    }
    
    func ButtonSetup() {
        backgroundColor = #colorLiteral(red: 0.7725490196, green: 0.5450980392, blue: 0.3725490196, alpha: 1)
        layer.cornerRadius = 10.0
    }

}

@IBDesignable
class EqualSignButton: UIButton {
    override func prepareForInterfaceBuilder() {
        ButtonSetup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ButtonSetup()
    }
    
    func ButtonSetup() {
        backgroundColor = #colorLiteral(red: 0.3803921569, green: 0.5843137255, blue: 0.737254902, alpha: 1)
        layer.cornerRadius = 10.0
    }
}

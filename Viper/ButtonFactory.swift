//
//  ButtonFactory.swift
//  Viper
//
//  Created by Юрий Нориков on 31.10.2019.
//  Copyright © 2019 norikoff. All rights reserved.
//

import UIKit

class ButtonFactory: UIButton {
    
    private static let screenWidth:CGFloat = UIScreen.main.bounds.width
    private static let screenHeight:CGFloat = UIScreen.main.bounds.height
    
    // Center
    private static let horizontialCenter:CGFloat = screenWidth/2
    private static let verticalDistance:CGFloat = screenHeight/8
    
    
    static func createCustomButton(lable:String, y:CGFloat ) -> UIButton{
        let btnFrame: CGRect = CGRect(x: horizontialCenter/4, y: y, width: 300, height: 100)
        let btnTitle: String = lable
        let btnTitleColor: UIColor = .blue
        let btnTitleFont: UIFont = UIFont.boldSystemFont(ofSize: 35)
        
        let customButton:UIButton = createButtonByType(btnType: UIButton.ButtonType.custom, btnFrame: btnFrame, title: btnTitle, titleColor: btnTitleColor, titleFont: btnTitleFont)
        
        return customButton
    }
    
    /* This is the general function to create button, the input parameter decide the button type and outlook. */
    static func createButtonByType(btnType:UIButton.ButtonType, btnFrame:CGRect, title: String, titleColor: UIColor, titleFont: UIFont) -> UIButton {
        
        // Create the button with the button type.
        let btn:UIButton = UIButton(type: btnType)
        
        // Set button frame.
        btn.frame = btnFrame
        
        // Set button center point location.
        //        btn.center = btnCenter
        
        // Set button title.
        btn.setTitle(title, for: UIControl.State.normal)
        
        // Set button title color.
        btn.setTitleColor(titleColor, for: UIControl.State.normal)
        
        // Set button title font.
        btn.titleLabel?.font = titleFont
        
        // Return the created button object.
        return btn
        
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

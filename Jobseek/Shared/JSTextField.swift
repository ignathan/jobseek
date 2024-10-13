//
//  JSTextField.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import UIKit

class JSTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        borderStyle = .roundedRect
        
        tintColor = .button
        
        font = .body2
        
        textColor = .textPrimary
        
        autocapitalizationType = .none
        
        returnKeyType = .done
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

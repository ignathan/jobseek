//
//  JSPrimaryButton.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import UIKit

class JSPrimaryButton: UIButton {
    
    var bgColor = UIColor.clear {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    var disabledColor = UIColor.clear
    
    public override var isEnabled: Bool {
        didSet {
            self.backgroundColor = isEnabled ? bgColor : disabledColor
        }
    }
    
    init(backgroundColor: UIColor = .backgroundBrand,
         disabledColor: UIColor = .backgroundBrand.withAlphaComponent(0.5)) {
        super.init(frame: .zero)
        defer {
            self.bgColor = backgroundColor
            self.disabledColor = disabledColor
        }
        translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel?.font = .button
        
        setTitleColor(.textReversed, for: .normal)
        
        layer.cornerRadius = 8
        
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  JSLabel.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 14/10/2024.
//

import UIKit

class JSLabel: UILabel {
    
    init(font: UIFont) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.font = font
        
        switch font {
        case .headline6:
            textColor = .textReversed
            
        case .caption:
            textColor = .textSecondary
            
        default:
            textColor = .textPrimary
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

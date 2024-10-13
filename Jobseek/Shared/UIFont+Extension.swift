//
//  UIFont+Extension.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 13/10/2024.
//

import UIKit

extension UIFont {
    
    static var headline6: UIFont {
        return .systemFont(ofSize: 18, weight: .bold)
    }
    
    static var headline7: UIFont {
        return .systemFont(ofSize: 16, weight: .semibold)
    }
    
    static var body2: UIFont {
        return .systemFont(ofSize: 16)
    }
    
    static var caption: UIFont {
        return .systemFont(ofSize: 14)
    }
    
    static var button: UIFont {
        return .systemFont(ofSize: 16, weight: .semibold)
    }
}

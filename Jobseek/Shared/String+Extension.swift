//
//  String+Extension.swift
//  Jobseek
//
//  Created by Ignatius Nathan on 13/10/2024.
//

extension String {
    
    func localized() -> String {
        return String(localized: String.LocalizationValue(self))
    }
}

extension Optional where Wrapped == String {
    
    var isEmptyOrNil: Bool {
        
        guard let self else { return true }
        
        return self.isEmpty
    }
}
